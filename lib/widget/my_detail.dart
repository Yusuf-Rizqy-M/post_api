import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/task_controller.dart';
import '../model/model_favorite.dart';
import 'my_text.dart';
import 'my_image_network.dart';

class MyDetail extends StatelessWidget {
  final String imagePath;
  final String album;
  final String genre;

  const MyDetail({
    Key? key,
    required this.imagePath,
    required this.album,
    required this.genre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskController favoriteController = Get.find<TaskController>();
    final modelFav = ModelFavorite(
      album: album,
      albumImage: imagePath,
      genre: genre,
    );

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar album
            MyImageNetwork(
              imageUrl: imagePath,
              width: 100,
              height: 100,
              borderRadius: 8.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            // Nama album
            MyText(
              hintText: album,
              fontSize: 16,
              colors: Colors.black,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            // Genre
            MyText(
              hintText: genre,
              fontSize: 14,
              colors: Colors.grey,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Tombol favorit
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Obx(() {
                final isFavorite = favoriteController.isFavorite(modelFav);
                return IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () {
                    if (isFavorite) {
                      favoriteController.removeFavorite(modelFav);
                    } else {
                      favoriteController.addFavorite(modelFav);
                    }
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
