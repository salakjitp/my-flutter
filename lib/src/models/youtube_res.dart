import 'dart:convert';

YoutubeRes youtubeResponseFromJson(String str) =>
    YoutubeRes.fromJson(json.decode(str));

String youtubeResponseToJson(YoutubeRes data) => json.encode(data.toJson());

class YoutubeRes {
  YoutubeRes({
    required this.youtubes,
    required this.error,
    required this.errorMsg,
  });

  final List<Youtube> youtubes;
  final bool error;
  final String errorMsg;

  factory YoutubeRes.fromJson(Map<String, dynamic> json) => YoutubeRes(
        youtubes: List<Youtube>.from(
            json["youtubes"].map((x) => Youtube.fromJson(x))),
        error: json["error"],
        errorMsg: json["error_msg"],
      );

  Map<String, dynamic> toJson() => {
        "youtubes": List<dynamic>.from(youtubes.map((x) => x.toJson())),
        "error": error,
        "error_msg": errorMsg,
      };
}

class Youtube {
  Youtube({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.avatarImage,
    required this.youtubeImage,
  });

  final String id;
  final String title;
  final String subtitle;
  final String avatarImage;
  final String youtubeImage;

  factory Youtube.fromJson(Map<String, dynamic> json) => Youtube(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        avatarImage: json["avatar_image"],
        youtubeImage: json["youtube_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "avatar_image": avatarImage,
        "youtube_image": youtubeImage,
      };
}
