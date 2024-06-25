import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/login_page.dart';

import 'package:placemnet_system_frontend/module/admin/image_picker.dart';
import 'package:placemnet_system_frontend/providers/tab_index_provider.dart';
import 'package:placemnet_system_frontend/providers/user_type_provider.dart';
import 'package:placemnet_system_frontend/services/auth_services.dart';
import 'package:provider/provider.dart';

Widget defaultHome = LoginPage();

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TabIndexProvider()),
      ChangeNotifierProvider(create: (_) => UserTypeProvider()),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Placement Management System",
        theme: ThemeData(
          fontFamily: "Inter",
          iconTheme: const IconThemeData(color: litBlue),
        ),
        home: defaultHome,
        // home: PickImage()
        // home:  EditAdminProfile ()
        // home: Provider.of<UserTypeProvider>(context).user.token.isEmpty ? const SignupPage() : const StudentDashboard(),
      ),
    );
  }
}
