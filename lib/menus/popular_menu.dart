import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_api/item_artist.dart';
import 'package:post_api/model/modelartist.dart';

import '../widget/my_text.dart';

class PopularMenu extends StatelessWidget {
  final List<ModelArtist> artists = PopularArtistsData.getPopularArtists();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Music", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: artists.length,
          itemBuilder: (context, index) {
            final artist = artists[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    artist.imagePath,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: MyText(
                  hintText: artist.name,
                  fontSize: 14,
                  colors: Colors.black,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(artist.genre),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  if (artist.name == "One Direction") {
                    Get.toNamed('/detailonedirection');
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
