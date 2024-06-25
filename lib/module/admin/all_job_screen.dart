import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/constants/default_url.dart';
import 'package:placemnet_system_frontend/module/Models/job.dart';
import 'package:placemnet_system_frontend/module/admin/pending_job_details_screen.dart';
import 'package:placemnet_system_frontend/services/job_services.dart';

import '../Models/job_cart_item.dart';

class AllJobs extends StatelessWidget {
  AllJobs({super.key});

  JobService jobService = JobService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<JobCartItem>>(
        future: jobService.fetchJobCartItems(),
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
                              builder: (context) => PendinJobDetailsScreen(
                                jobCartItem: jobCartItem,
                              ),
                            ),
                          );
                        },
                        title: Text(cartItems[index].title),
                        subtitle: Row(
                          children: [
                            Text(cartItems[index].experience),
                            SizedBox(width: 50.w,),
                            Text(cartItems[index].vacancy),
                          ],
                        ),
                        
                        // trailing: Text(cartItems[index].vacancy),
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
