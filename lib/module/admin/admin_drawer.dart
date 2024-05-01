import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminDrawer extends StatelessWidget {
 final GlobalKey<ScaffoldState> scaffoldKey;

  const AdminDrawer({Key? key, required this.scaffoldKey}) : super(key: key);

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
              // Navigate to Dashboard or perform any action
              Navigator.pop(context); // Close the drawer
            },
            title: const Text("Dashboard"),
          ),
          ListTile(
            onTap: () {
              // Navigate to Student or perform any action
              Navigator.pop(context); // Close the drawer
            },
            title: const Text("Student"),
          ),
          ListTile(
            onTap: () {
              // Navigate to Company Request or perform any action
              Navigator.pop(context); // Close the drawer
            },
            title: const Text("Company Request"),
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


