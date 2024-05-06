import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/module/admin/admin_dashboard.dart';
import 'package:placemnet_system_frontend/module/company/company_dashborad.dart';
import 'package:placemnet_system_frontend/module/student/student_dashboard.dart';
import 'package:placemnet_system_frontend/providers/user_type_provider.dart';
import 'package:placemnet_system_frontend/services/auth_services.dart';
import 'package:placemnet_system_frontend/signup_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final List<String> dropdownOptions = const ["Admin", "Student", "Company"];
  String _selectedUserType = "Student";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final AuthService authService = AuthService();

   void loginUser() {
    authService.signInUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
      role: roleController.text
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserTypeProvider(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 150.h, 0, 40.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: primayBlue,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      const Text(
                        "Please Sign in to Continue",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: primayBlue,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    TextField(
                      controller: emailController,
                      style: const TextStyle(
                        color: creamyWhite,
                      ),
                      decoration: InputDecoration(
                        hintText: "useremail@mail.com",
                        hintStyle: TextStyle(
                          color: creamyWhite.withOpacity(0.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: secondaryBlue,
                        filled: true,
                        iconColor: creamyWhite,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                          child: Icon(
                            Icons.person,
                            color: creamyWhite,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextField(
                      controller: passwordController,
                      style: const TextStyle(
                        color: creamyWhite,
                      ),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: creamyWhite.withOpacity(0.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: secondaryBlue,
                        filled: true,
                        iconColor: creamyWhite,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Icon(
                            Icons.password,
                            color: creamyWhite,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      decoration: BoxDecoration(
                        color: secondaryBlue,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 7, 10, 7),
                        child: Consumer<UserTypeProvider>(
                          builder: (context, userTypeProvider, _) =>
                              DropdownButtonFormField<String>(
                            value: userTypeProvider.userTypeValue,
                            onChanged: (String? newValue) {
                              userTypeProvider.userTypeValue = newValue!;
                              setState(() {
                                  _selectedUserType = newValue;
                                roleController.text = newValue;
                              });
                            },
                            items: dropdownOptions
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 28, 223, 132),
                                  ),
                                ),
                              );
                            }).toList(),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.person,
                                color: creamyWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: loginUser,
                      // onPressed: () {
                      //   print('$_selectedUserType');
                      //   switch (_selectedUserType) {
                      //     case 'Admin':
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => AdminDashboard(),
                      //         ),
                      //       );
                      //       break;
                      //     case 'Student':
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) =>
                      //                 const StudentDashboard()),
                      //       );
                      //       break;
                      //     case 'Company':
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) =>
                      //                 const CompnayDashborad()),
                      //       );
                      //       break;
                      //   }
                      // },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: litBlue,
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 16, color: creamyWhite),
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(fontSize: 12, color: primayBlue),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 12, color: skyBlue),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignupPage()));
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              color: litBlue,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

