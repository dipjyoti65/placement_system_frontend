class CompanyDetails {
  final String name;
  // final String studentId;
  CompanyDetails({
    required this.name,
    // required this.studentId,
  });

  factory CompanyDetails.fromJson(Map<String, dynamic> json) {
    return CompanyDetails(
      name: json['name'],
      // studentId: json['studentId'],
    );
  }
}
