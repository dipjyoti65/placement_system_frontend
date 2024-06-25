import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/module/Models/company_details.dart';
import 'package:placemnet_system_frontend/module/Models/student_details.dart';
import 'package:placemnet_system_frontend/services/user_services.dart';

class AllStudentData extends StatelessWidget {
  AllStudentData({super.key});

  UserService userService = UserService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registered Students"),
      ),
      body: FutureBuilder<List<CompanyDetails>>(
          future: userService.getAllStudents(),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapShot.hasError) {
              return Center(
                child: Text('Error: ${snapShot.error}'),
              );
            } else {
              final cartItems = snapShot.data!;
              return ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                   CompanyDetails studentDetails = cartItems[index];
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
                              fontSize: 16
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
