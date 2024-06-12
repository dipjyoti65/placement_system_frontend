import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/module/Models/job_cart_item.dart';
import 'package:placemnet_system_frontend/module/company/applied_job_student_list.dart';
import 'package:placemnet_system_frontend/module/company/bottom_navigation_bar.dart';
import 'package:placemnet_system_frontend/providers/user_type_provider.dart';
import 'package:placemnet_system_frontend/services/job_services.dart';
import 'package:provider/provider.dart';

class ApprovedJobList extends StatefulWidget {
  const ApprovedJobList({super.key});

  @override
  State<ApprovedJobList> createState() => _ApprovedJobListState();
}

class _ApprovedJobListState extends State<ApprovedJobList> {
  final JobService jobService = JobService();
  late Future<List<JobCartItem>> _jobFuture;

  @override
  void initState() {
    super.initState();
    var userProvider = Provider.of<UserTypeProvider>(context, listen: false);
    var companyId = userProvider.user.id;
    _jobFuture = jobService.fetchApprovedJobforCompany(context,companyId);
  }

  Future<void> _refreshJobs() async {
    setState(() {
       var userProvider = Provider.of<UserTypeProvider>(context, listen: false);
    var companyId = userProvider.user.id;
      _jobFuture = jobService.fetchApprovedJobforCompany(context,companyId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _jobFuture,
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapShot.hasError) {
              return Center(child: Text('Error: ${snapShot.error}'));
            } else if (!snapShot.hasData || snapShot.data!.isEmpty) {
              return Center(child: Text('No Approved job found... '));
            } else {
              final cartItems = snapShot.data!;
              return RefreshIndicator(
                onRefresh: _refreshJobs,
                child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      JobCartItem jobCartItem = cartItems[index];
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
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>AppliedStudentList(jobCartItem: jobCartItem)));
                              },
                              title: Text(cartItems[index].title),
                              subtitle: Text(cartItems[index].experience),
                              trailing: Text(cartItems[index].vacancy),
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
      }),
      bottomNavigationBar: Container(color: coolBlue, child: NavBar()),
    );
  }
}
