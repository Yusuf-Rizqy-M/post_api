class ApiModel {
  final String strAlbum;
  final String strArtist;
  final String strAlbum3DCase;
  final String strDescriptionEN;
  final String strGenre;

  ApiModel.MusicModel( {
    required this.strAlbum,
    required this.strArtist,
    required this.strAlbum3DCase,
    required this.strDescriptionEN,
    required this.strGenre,
  });

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel.MusicModel(
      strAlbum: json['strAlbum'] ?? '',
      strArtist: json['intYearReleased'] ?? '',
      strAlbum3DCase: json['strAlbumThumb'] ?? '',
      strDescriptionEN: json['strDescriptionEN'] ?? 'Empty Description',
      strGenre: json['strGenre'] ?? '',
    );
  }
}


