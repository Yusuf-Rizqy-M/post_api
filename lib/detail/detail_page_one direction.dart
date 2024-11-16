import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_api/Api/Api_Controller.dart';
import 'package:post_api/widget/my_image.dart';
import 'package:post_api/widget/my_text.dart';
import '../controller/task_controller.dart';
import '../widget/my_detail.dart';

class DetailPageOnedirection extends StatelessWidget {
  final ApiController musicController = Get.put(ApiController());

  DetailPageOnedirection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskController favoriteController = Get.find<TaskController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: MyText(
          hintText: "One Direction Albums",
          fontSize: 20,
          colors: Colors.black,
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: MyImage(
              imageName: "assets/images/azazel.jpg",
              width: 40,
              height: 40,
              borderRadius: 20,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            // Albums List
            Expanded(
              child: Obx(() {
                if (musicController.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  );
                }
                return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: musicController.postList.length,
                  itemBuilder: (context, index) {
                    final post = musicController.postList[index];

                    // Menggunakan MyDetail untuk menampilkan detail album
                    return MyDetail(
                      imagePath: post.strAlbum3DCase,
                      album: post.strAlbum,
                      // artist: post.strArtist,
                      // description: post.strDescriptionEN,
                      genre: post.strGenre,
                    );
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
