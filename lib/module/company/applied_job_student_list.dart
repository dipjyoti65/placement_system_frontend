import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/module/Models/job_cart_item.dart';
import 'package:placemnet_system_frontend/module/Models/student_details.dart';
import 'package:placemnet_system_frontend/services/job_services.dart';

class AppliedStudentList extends StatefulWidget {
  final JobCartItem jobCartItem;
  const AppliedStudentList({super.key, required this.jobCartItem});

  @override
  State<AppliedStudentList> createState() => _AppliedStudentListState();
}

class _AppliedStudentListState extends State<AppliedStudentList> {
  final JobService jobService = JobService();
  late Future<List<StudentDetails>> _studentList;

  @override
  void initState() {
    super.initState();
    _studentList = jobService.fetchStudentList(widget.jobCartItem.jobid);
  }

  Future<void> _refreshStudentList() async {
    setState(() {
      _studentList = jobService.fetchStudentList(widget.jobCartItem.jobid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _studentList,
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapShot.hasError) {
              return Center(child: Text('Error: ${snapShot.error}'));
            } else if (!snapShot.hasData || snapShot.data!.isEmpty) {
              return Center(child: Text('No Student Found....'));
            } else {
              final cartIems = snapShot.data!;
              return RefreshIndicator(
                onRefresh: _refreshStudentList,
                child: ListView.builder(
                    itemCount: cartIems.length,
                    itemBuilder: (context, index) {
                      StudentDetails studentDetails = cartIems[index];
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
                              onTap: () {},
                              title: Text(cartIems[index].name),
                              titleTextStyle: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: secondaryBlue,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              );
            }
          }),
    );
  }
}
