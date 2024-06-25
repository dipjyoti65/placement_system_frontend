
import 'package:flutter/material.dart';
import 'package:placemnet_system_frontend/module/student/student_applied_job_scrren.dart';
import 'package:placemnet_system_frontend/module/student/student_approve_job_screen.dart';
import 'package:placemnet_system_frontend/services/auth_services.dart';

class StudentDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;

  StudentDrawer({super.key, required this.globalKey});

  @override
  _StudentDrawerState createState() => _StudentDrawerState();
}

class _StudentDrawerState extends State<StudentDrawer> {
  final AuthService authService = AuthService();

  void logoutUser() {
    authService.logoutUser(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text("Hello"),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudentApprovedJobs()),
              );
            },
            title: const Text("Job Openings"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const StudentGetAppliedJobs()),
              );
            },
            title: const Text("Applied Jobs"),
          ),
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
    );
  }
}
