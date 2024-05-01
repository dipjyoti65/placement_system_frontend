import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/login_page.dart';
import 'package:placemnet_system_frontend/module/admin/admin_dashboard.dart';
import 'package:placemnet_system_frontend/module/admin/admin_drawer.dart';
import 'package:placemnet_system_frontend/module/company/company_dashborad.dart';
import 'package:placemnet_system_frontend/module/student/student_dashboard.dart';
import 'package:placemnet_system_frontend/providers/tab_index_provider.dart';
import 'package:provider/provider.dart';

Widget defaultHome = LoginPage();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => TabIndexProvider()),
            // Add DrawerStateProvider here
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Placement Management System",
            theme: ThemeData(
              fontFamily: "Inter",
              iconTheme: const IconThemeData(color: litBlue),
            ),
            home: defaultHome,
          ),
        );
      },
    );
  }
}

class MyAppHomePage extends StatelessWidget {
  const MyAppHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TabIndexProvider>(
      builder: (context, tabProvider, child) {
        switch (tabProvider.tabIndex) {
          case 0:
            return AdminDashboard();
          case 1:
            return const StudentDashboard();
          case 2:
            return const CompnayDashborad();
          default:
            return const StudentDashboard();
        }
      },
    );
  }
}
