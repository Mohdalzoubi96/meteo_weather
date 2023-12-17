class MusicListModel {
  final String musicName;
  final String signerName;
  final String musicTime;
  final bool isPlayed;

  MusicListModel({
    required this.musicName,
    required this.signerName,
    required this.musicTime,
    required this.isPlayed,
  });

  factory MusicListModel.fromJson(MusicListModel data) => MusicListModel(
        musicName: data.musicName,
        signerName: data.signerName,
        musicTime: data.musicTime,
        isPlayed: data.isPlayed,
      );
}
