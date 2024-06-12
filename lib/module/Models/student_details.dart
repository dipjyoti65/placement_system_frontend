class StudentDetails {
  final String name;

  StudentDetails({
    required this.name,
  });

  factory StudentDetails.fromJson(Map<String,dynamic> json){
    return StudentDetails(
      name: json['name']
    );
  }
}
