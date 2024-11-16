import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_api/Api/Api_Controller.dart';
import 'package:post_api/widget/my_image_network.dart';
import '../controller/task_controller.dart';
import '../widget/my_image.dart';
import '../widget/my_text.dart';

class HomeMenuMobile extends StatelessWidget {
  final ApiController musicController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text("Genre", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  genreItem('Sufi', 'assets/images/sufi.png'),
                  genreItem('Rock', 'assets/images/rock.png'),
                  genreItem('Pop', 'assets/images/pop.png'),
                  genreItem('Jazz', 'assets/images/jazz.png'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Popular 🔥",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                popularItem('One Direction', 'Pop', 'assets/images/onedirection.png'),
                popularItem('SZA', 'R&B', 'assets/images/sza.png'),
                popularItem('Drake', 'Hip-Hop', 'assets/images/drake.png'),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Recently Played",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Bagian Recently Played
            // Bagian Recently Played
            Obx(() {
              if (musicController.isLoading.value) {
                return const Center(child: CircularProgressIndicator(color: Colors.blue));
              }
              if (musicController.postList.isEmpty) {
                return const Center(child: Text("No recently played songs available."));
              }
              return SizedBox(
                height: 200, // Tinggi container keseluruhan untuk tampilan horizontal
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Membuat scroll ke kanan saja
                  itemCount: musicController.postList.length,
                  itemBuilder: (context, index) {
                    final post = musicController.postList[index];
                    if (post.strAlbum3DCase.isEmpty) return const SizedBox.shrink();
                    return GestureDetector(
                      onTap: () => Get.toNamed('/detailonedirection', arguments: post),
                      child: Container(
                        width: 120, // Lebar card untuk konsistensi
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Card(
                          color: Colors.black26,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MyImageNetwork(
                                  imageUrl: post.strAlbum3DCase,
                                  width: 80, // Lebar gambar tetap
                                  height: 80, // Tinggi gambar tetap
                                  borderRadius: 8.0,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 8.0),
                                MyText(
                                  hintText: post.strAlbum,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  colors: Colors.yellow,
                                  textAlign: TextAlign.center, // Teks di tengah
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget genreItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              imagePath,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget popularItem(String title, String artist, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                artist,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
