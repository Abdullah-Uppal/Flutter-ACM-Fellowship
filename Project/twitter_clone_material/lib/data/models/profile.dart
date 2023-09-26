import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  int? id;
  DateTime? createdAt;
  String? username;
  String? profilePicture;
  String? fullName;

  Profile(
      {this.id,
      this.createdAt,
      this.fullName,
      this.profilePicture,
      this.username});

  factory Profile.fromMap(Map<String, dynamic> data) {
    return Profile(
        id: data['id'],
        createdAt: DateTime.parse(data['created_at']),
        username: data['username'],
        profilePicture: data['profile_picture'],
        fullName: data['full_name']);
  }

  @override
  List<Object?> get props => [id, username];
}
