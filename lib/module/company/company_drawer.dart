
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/module/student/student_applied_job_scrren.dart';
import 'package:placemnet_system_frontend/module/student/student_approve_job_screen.dart';
import 'package:placemnet_system_frontend/services/auth_services.dart';

class CompanyDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;

  CompanyDrawer({super.key, required this.globalKey});

  @override
  _StudentDrawerState createState() => _StudentDrawerState();
}

class _StudentDrawerState extends State<CompanyDrawer> {
  final AuthService authService = AuthService();

  void logoutUser() {
    authService.logoutUser(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(
          top: 30.h,
        ),
        child: ListView(
          children: [
            ListTile(
              onTap: () async {
                logoutUser(); // Call the logout method here
              },
              title: const Text("Logout"),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: const Text("Close"),
            ),
          ],
        ),
      ),
    );
  }
}
