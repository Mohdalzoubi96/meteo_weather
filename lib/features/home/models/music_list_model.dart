class MusicListModel {
  String? musicName;
  String? signerName;
  String? musicTime;
  bool? isPlayed;

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

  MusicListModel.copyWith({
    String? musicName,
    String? signerName,
    String? musicTime,
    bool? isPlayed,
  }) {
    MusicListModel(
      musicName: musicName ?? this.musicName,
      signerName: signerName ?? this.signerName,
      musicTime: musicTime ?? this.musicTime,
      isPlayed: isPlayed ?? this.isPlayed,
    );
  }
}
