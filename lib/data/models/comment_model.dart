class CommentModel {
  final String userName;
  final String userImage;
  final String timeAgo;
  final String comment;
  final int likes;
  final int dislikes;
  final int comments;
  final int replies;

  CommentModel({
    required this.userName,
    required this.userImage,
    required this.timeAgo,
    required this.comment,
    required this.likes,
    required this.dislikes,
    required this.comments,
    required this.replies,
  });
}
