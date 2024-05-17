import 'dart:convert';

class Application {
  final String studentId;
  final String jobId;
 

  Application(
      {required this.studentId, required this.jobId});

  Map<String, dynamic> toMap() {
    return {'studentId': studentId, 'jobId': jobId};
  }

  factory Application.fromMap(Map<String, dynamic> map) {
    return Application(
      studentId: map['studentId'] ?? '',
      jobId: map['jobId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Application.fromJson(String source) =>
      Application.fromMap(json.decode(source));
}
