class VideoModel {
  // Class fields (parameters)
  final String thumbPath;
  final String avatarPath;
  final String videoTitle;
  final String facultyName;
  final String videoViews;
  final String videoTime;
  final int videoDurationSec;

  // Constructor
  VideoModel({
    required this.thumbPath,
    required this.avatarPath,
    required this.videoTitle,
    required this.facultyName,
    required this.videoViews,
    required this.videoTime,
    required this.videoDurationSec,
  });
}
