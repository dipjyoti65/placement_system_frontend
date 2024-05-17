import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/module/admin/approved_job_details.dart';
import 'package:placemnet_system_frontend/services/job_services.dart';
import '../Models/job_cart_item.dart';

class ApprovedJobs extends StatefulWidget {
  const ApprovedJobs({super.key});

  @override
  State<ApprovedJobs> createState() => _ApprovedJobsState();
}

class _ApprovedJobsState extends State<ApprovedJobs> {
  final JobService jobService = JobService();
  late Future<List<JobCartItem>> _jobFuture;

  @override
  void initState() {
    super.initState();
    _jobFuture = jobService.fetchApprovedjob();
  }

  Future<void> _refreshJobs() async {
    setState(() {
      _jobFuture = jobService.fetchApprovedjob();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<JobCartItem>>(
        future: _jobFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No approved jobs found.'));
          } else {
            final cartItems = snapshot.data!;
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ApprovedJobDetailsScreen(
                                  jobCartItem: jobCartItem,
                                ),
                              ),
                            );
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
                          leadingAndTrailingTextStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: secondaryBlue,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
