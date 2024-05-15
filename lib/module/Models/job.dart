import 'dart:convert';

class Job {
  final String companyId;
  final String title;
  final String experience;
  final String vacancy;
  final String description;

  Job({
    required this.companyId,
    required this.title,
    required this.experience,
    required this.vacancy,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'companyId': companyId,
      'title': title,
      'experience': experience,
      'vacancy': vacancy,
      'description': description
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      companyId: map['companyId'] ?? '',
      title: map['title'] ?? '',
      experience: map['experience'] ?? '',
      vacancy: map['vacancy'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Job.fromJson(String source) => Job.fromMap(json.decode(source));
}
