class UserProfile {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final int streakDays;
  final int xp;
  final int level;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.streakDays,
    required this.xp,
    required this.level,
  });
}
