class JobCartItem {
  final String jobid;
  final String title;
  final String experience;
  final String vacancy;
  final String description;

  JobCartItem(
      {
      required this.jobid,
      required this.title,
      required this.experience,
      required this.vacancy,
      required this.description});

  factory JobCartItem.fromJson(Map<String, dynamic> json) {
    return JobCartItem(
      jobid: json['_id'],
      title: json['title'],
      experience: json['experience'],
      vacancy: json['vacancy'],
      description: json['description'],
    );
  }
}
