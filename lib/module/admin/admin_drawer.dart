import 'package:flutter/material.dart';
import 'package:placemnet_system_frontend/module/admin/all_job_screen.dart';
import 'package:placemnet_system_frontend/module/admin/all_student_screen.dart';
import 'package:placemnet_system_frontend/module/admin/approved_job_screen.dart';
import 'package:placemnet_system_frontend/services/auth_services.dart';
import 'package:provider/provider.dart';

class AdminDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  AdminDrawer({super.key, required this.scaffoldKey});
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    void logoutUser() {
      authService.logoutUser(context: context);
    }

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
              // Navigate to Dashboard or perform any action
              Navigator.pop(context); // Close the drawer
            },
            title: const Text("Dashboard"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllStudentData(),
                ),
              );
            },
            title: const Text("Student"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllJobs()),
              );
            },
            title: const Text("Pending Job Request"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const ApprovedJobs()),
                ),
              );
            },
            title: const Text("Approved Job"),
          ),
          ListTile(
            onTap: () async {
              logoutUser();
            },
            title: const Text("Logout"),
          ),
          ListTile(
            onTap: () {
              // Close the drawer
              Navigator.pop(context);
            },
            title: const Text("Close"),
          )
        ],
      ),
    );
  }
}
