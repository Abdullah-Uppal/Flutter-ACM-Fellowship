// equatable note class with two attributes title and description
import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String title;
  final String description;
  final String createdAt;
  const Note({
    required this.title,
    required this.description,
    required this.createdAt,
  });

  @override
  List<Object> get props => [title, description, createdAt];
}
