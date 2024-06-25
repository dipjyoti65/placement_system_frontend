class StudentDetails {
  final String name;
  final String studentId;
  StudentDetails({
    required this.name,
    required this.studentId,
  });

  factory StudentDetails.fromJson(Map<String, dynamic> json) {
    return StudentDetails(
      name: json['name'],
      studentId: json['studentId'],
    );
  }
}
