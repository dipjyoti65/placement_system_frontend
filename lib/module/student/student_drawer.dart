import 'package:flutter/material.dart';
import 'package:placemnet_system_frontend/module/student/student_approve_job_screen.dart';

class StudentDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> globalKey;
  const StudentDrawer({super.key, required this.globalKey});

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
                MaterialPageRoute(builder: (context)=> StudentApprovedJobs()));
            },
            title: const Text("Job Openings"),
          ),
          ListTile(
            onTap: () {},
            title: const Text("Applied Jobs"),
          ),
          ListTile(
            onTap: () {},
            title: const Text("Logout"),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            title: const Text("Close"),
          )
        ],
      ),
    );
  }
}
