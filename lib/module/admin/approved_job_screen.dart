import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/module/admin/approved_job_details.dart';
import 'package:placemnet_system_frontend/services/job_services.dart';
import '../Models/job_cart_item.dart';

// ignore: must_be_immutable
class ApprovedJobs extends StatelessWidget {
  ApprovedJobs({super.key});

  JobService jobService = JobService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<JobCartItem>>(
        future: jobService.fetchApprovedjob(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final cartItems = snapshot.data!;
            return ListView.builder(
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
            );
          }
        },
      ),
    );
  }
}
