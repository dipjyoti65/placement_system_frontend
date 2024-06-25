import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/module/Models/student_details.dart';
import 'package:placemnet_system_frontend/services/job_application_services.dart';

class AllSelectedStudent extends StatelessWidget {
  AllSelectedStudent({super.key});
  JobApplicationService jobApplicationService = JobApplicationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Selected Students"),
      ),
      body: FutureBuilder<List<StudentDetails>>(
        future: jobApplicationService.fetchSelectedStudent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No Student is selected'),
            );
          } else {
            final cartItems = snapshot.data!;
            return ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                StudentDetails studentDetails = cartItems[index];

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
                        title: Text(cartItems[index].name),
                        titleTextStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: secondaryBlue,
                          fontSize: 16,
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
