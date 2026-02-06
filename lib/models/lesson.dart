class Lesson {
  final String id;
  final String title;
  final String subtitle;
  final bool isLocked;
  final double progress; // 0.0 to 1.0
  final int rating; // 1 to 3 stars

  Lesson({
    required this.id,
    required this.title,
    required this.subtitle,
    this.isLocked = false,
    this.progress = 0.0,
    this.rating = 0,
  });
}
