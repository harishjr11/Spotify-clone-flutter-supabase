// First, create profile_model.dart
class UserProfile {
  final String id;
  final String email;
  final String fullName;
  final String? avatarUrl;
  final DateTime joinedAt;
  final int totalSongs; // For tracking user's music
  final int playlistCount;

  UserProfile({
    required this.id,
    required this.email,
    required this.fullName,
    this.avatarUrl,
    required this.joinedAt,
    this.totalSongs = 0,
    this.playlistCount = 0,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      email: json['email'],
      fullName: json['full_name'],
      avatarUrl: json['avatar_url'],
      joinedAt: DateTime.parse(json['created_at']),
      totalSongs: json['total_songs'] ?? 0,
      playlistCount: json['playlist_count'] ?? 0,
    );
  }
}