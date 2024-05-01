import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/providers/user_type_provider.dart';
import 'package:placemnet_system_frontend/login_page.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key});

  final List<String> dropdownOptions = const ["Student", "Company"];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserTypeProvider(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 100, 0, 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: primayBlue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Please fill the input below here",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: primayBlue,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    TextField(
                      style: const TextStyle(
                        color: creamyWhite,
                      ),
                      decoration: InputDecoration(
                        hintText: "Username",
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
                    const SizedBox(height: 10),
                    TextField(
                      style: TextStyle(
                        color: creamyWhite,
                      ),
                      decoration: InputDecoration(
                        hintText: "useremail@mail.com",
                        hintStyle: TextStyle(
                          color: creamyWhite.withOpacity(0.5),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: secondaryBlue,
                        filled: true,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                          child: Icon(
                            Icons.email,
                            color: creamyWhite,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      style: TextStyle(
                        color: creamyWhite,
                      ),
                      decoration: InputDecoration(
                        hintText: "password",
                        hintStyle: TextStyle(
                          color: creamyWhite.withOpacity(0.5),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: secondaryBlue,
                        filled: true,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                          child: Icon(
                            Icons.password,
                            color: creamyWhite,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: litBlue,
                      ),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(fontSize: 16, color: creamyWhite),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 12, color: skyBlue),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginPage()));
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: litBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
