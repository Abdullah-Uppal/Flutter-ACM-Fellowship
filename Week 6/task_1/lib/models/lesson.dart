import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

@immutable
class Lesson {
  final DateTime? createdAt;
  final String? name;
  final int? duration;
  final String? category;
  final bool? locked;
  final String? id;
  late final String image;
  Lesson({
    this.createdAt,
    this.name,
    this.duration,
    this.category,
    this.locked,
    this.id,
  }) {
    int randInt = Random(DateTime.now().microsecondsSinceEpoch).nextInt(2) + 1;
    image = "assets/images/image$randInt.png";
  }

  @override
  String toString() {
    return 'Lesson(createdAt: $createdAt, name: $name, duration: $duration, category: $category, locked: $locked, id: $id)';
  }

  factory Lesson.fromMap(Map<String, dynamic> data) => Lesson(
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        name: data['name'] as String?,
        duration: data['duration'] as int?,
        category: data['category'] as String?,
        locked: data['locked'] as bool?,
        id: data['id'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'createdAt': createdAt?.toIso8601String(),
        'name': name,
        'duration': duration,
        'category': category,
        'locked': locked,
        'id': id,
      };

  factory Lesson.fromJson(String data) {
    return Lesson.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}
