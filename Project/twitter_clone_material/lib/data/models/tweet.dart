import 'dart:ffi';
import 'package:equatable/equatable.dart';
import 'package:twitter_clone_material/data/models/profile.dart';

class Tweet extends Equatable {
  int? id;
  DateTime? createdAT;
  String? content;
  int? postedBy;
  Profile? profile;

  Tweet({this.createdAT, this.content, this.postedBy, this.id, this.profile});

  factory Tweet.fromMap(Map<String, dynamic> data) {
    return Tweet(
        createdAT: DateTime.parse(data['created_at']),
        content: data['content'],
        postedBy: data['posted_by'],
        id: data['id'],
        profile: Profile.fromMap(data['Profiles']));
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, postedBy];
}
