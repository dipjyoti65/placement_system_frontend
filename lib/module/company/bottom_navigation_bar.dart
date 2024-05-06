import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/providers/tab_index_provider.dart';
import 'package:placemnet_system_frontend/custom_icons_icons.dart';
import 'package:placemnet_system_frontend/module/company/add_new_jobs.dart';
import 'package:placemnet_system_frontend/module/company/company_dashborad.dart';
import 'package:placemnet_system_frontend/module/company/student_list.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  List<Widget> pageList = [
    const StudentList(),
    const CompnayDashboard(),
    AddNewJobs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabIndexProvider>(
      builder: (context, tabIndexProvider, _) => ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
        child: BottomNavigationBar(
          backgroundColor: secondaryBlue,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedIconTheme: const IconThemeData(
            color: creamyWhite,
          ),
          selectedIconTheme: const IconThemeData(color: skyBlue),
          onTap: (value) {
            tabIndexProvider.tabIndex = value;

            if (value != 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => pageList[value]),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => pageList[1]),
              );
            }
          },
          currentIndex: tabIndexProvider.tabIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.list),
              label: "Student_list",
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_rounded),
              label: "Add_Job",
            ),
          ],
        ),
      ),
    );
  }
}
