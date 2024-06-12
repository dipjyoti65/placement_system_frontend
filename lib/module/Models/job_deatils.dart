class JobDeatils {
  final String jobId;
  final String title;
  final String description;

  JobDeatils({
    required this.jobId,
    required this.title,
    required this.description,
  });

  factory JobDeatils.fromJson(Map<String, dynamic> json) {
    return JobDeatils(
        jobId: json['jobId'],
        title: json['title'],
        description: json['description']);
  }
}
