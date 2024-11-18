import 'package:post_api/model/modelartist.dart';

class PopularArtistsData {
  static List<ModelArtist> getPopularArtists() {
    return [
      ModelArtist(
        name: "SZA",
        imagePath: "assets/images/sza.png",
        genre: "R&B",
      ),
      ModelArtist(
        name: "The Weeknd",
        imagePath: "assets/images/theweeknd.png",
        genre: "Pop",
      ),
      ModelArtist(
        name: "One Direction",
        imagePath: "assets/images/onedirection.png",
        genre: "Pop",
      ),
      ModelArtist(
        name: "Billie Eilish",
        imagePath: "assets/images/billieelish.png",
        genre: "Alternative",
      ),
      ModelArtist(
        name: "Drake",
        imagePath: "assets/images/drake.png",
        genre: "Hip-Hop",
      ),

    ];
  }
}
