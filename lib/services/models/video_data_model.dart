class VideoDataModel {
  int? id;
  String? title;
  String? videoUrl;
  String? thumbnail;

  VideoDataModel({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.thumbnail,
  });

  VideoDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    videoUrl = json['videoUrl'];
    thumbnail = json['thumbnail'];
  }
}
