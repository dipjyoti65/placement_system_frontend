import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/services/job_services.dart';

class StudentGetAppliedJobs extends StatefulWidget {
  const StudentGetAppliedJobs({super.key});

  @override
  State<StudentGetAppliedJobs> createState() => StudentGetAppliedJobsState();
}

class StudentGetAppliedJobsState extends State<StudentGetAppliedJobs> {
  final JobService jobService = JobService();
  List<dynamic> appliedJobs = [];

  @override
  void initState() {
    super.initState();
    getStudentAppliedJobs(context);
  }

  Future<void> _refreshJobs() async {
    setState(() {
      getStudentAppliedJobs(context);
    });
  }

  Future<void> getStudentAppliedJobs(context) async {
    final jobs = await jobService.getStudentAppliedJobs(context: context);
    setState(() {
      appliedJobs = jobs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: appliedJobs.length,
          itemBuilder: (context, index) {
            final job = appliedJobs[index];
            return Card(
              margin: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 12,
              shadowColor: litBlue.withOpacity(0.5),
              child: Container(
                width: double.infinity,
                height: 65.h,
                decoration: BoxDecoration(
                  color: coolBlue,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ListTile(
                   
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => ApprovedJobDetailsScreen(
                    //         jobCartItem: jobCartItem,
                    //       ),
                    //     ),
                    //   );
                    // },
                    title: Text(job['title']),
                    subtitle: Row(
                      children: [
                        Text(
                            'Experience: ${job['experience']}, Vacancy: ${job['vacancy']}'
                        ),
                        SizedBox(width: 10.w,),
                        
                      ],
                    ),
                    titleTextStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: secondaryBlue,
                      fontSize: 16,
                    ),
                    subtitleTextStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: secondaryBlue,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

