import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/module/company/bottom_navigation_bar.dart';

class AddNewJobs extends StatelessWidget {
  const AddNewJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Add new jobs"),
          Container(
            width: double.infinity,
            height: 60.h,
            decoration: BoxDecoration(
              color: secondaryBlue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: NavBar(),
          ),
        ],
      ),
    );
  }
}
