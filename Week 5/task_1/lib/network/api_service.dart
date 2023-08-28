import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_1/models/lesson.dart';
import 'package:task_1/models/program.dart';

class ApiService {

  Future<List<Program>> getPrograms() async {
    const url = "https://632017e19f82827dcf24a655.mockapi.io/api/programs";
    var data = await http.get(Uri.parse(url));
    var decoded = jsonDecode(data.body) as Map<String, dynamic>;
    var programs = decoded['items'] as List<dynamic>;
    return programs.map((e) => Program.fromMap(e)).toList();
  }

  Future<List<Lesson>> getLessons() async {
    const url = "https://632017e19f82827dcf24a655.mockapi.io/api/lessons";
    var data = await http.get(Uri.parse(url));
    var decoded = jsonDecode(data.body) as Map<String, dynamic>;
    var lessons = decoded['items'] as List<dynamic>;
    return lessons.map((e) => Lesson.fromMap(e)).toList();
  }
  
}
