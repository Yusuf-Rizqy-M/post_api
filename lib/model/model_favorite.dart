import '../Api/Api_Model.dart';

class ModelFavorite {
  final String album;
  final String? artist;
  final String albumImage;
  final String? description;
  final String genre;

  ModelFavorite({
    required this.album,
    this.artist,
    required this.albumImage,
    this.description,
    required this.genre,
  });

  // Konversi ModelFavorite ke Map untuk penyimpanan
  Map<String, dynamic> toMap() {
    return {
      'album': album,
      'artist': artist,
      'albumImage': albumImage,
      'description': description,
      'genre': genre,
    };
  }

  // Konversi Map ke ModelFavorite
  factory ModelFavorite.fromMap(Map<String, dynamic> map) {
    return ModelFavorite(
      album: map['album'] as String,
      artist: map['artist'] as String,
      albumImage: map['albumImage'] as String,
      description: map['description'] as String,
      genre: map['genre'] as String,
    );
  }

  // Factory untuk mengonversi dari ApiModel ke ModelFavorite
  factory ModelFavorite.fromApiModel(ApiModel apiModel) {
    return ModelFavorite(
      album: apiModel.strAlbum,
      artist: apiModel.strArtist,
      albumImage: apiModel.strAlbum3DCase,
      description: apiModel.strDescriptionEN,
      genre: apiModel.strGenre,
    );
  }
}
