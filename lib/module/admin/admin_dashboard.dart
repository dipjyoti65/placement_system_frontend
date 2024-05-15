import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/module/admin/admin_drawer.dart';
import 'package:placemnet_system_frontend/custom_icons_icons.dart';
import 'package:placemnet_system_frontend/module/admin/all_job_screen.dart';
import 'package:placemnet_system_frontend/module/company/add_new_jobs.dart';
import 'package:provider/provider.dart';

class AdminDashboard extends StatefulWidget {
  AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              height: 50.h,
              decoration: BoxDecoration(
                color: skyBlue,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.account_circle, size: 30),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 50),
              child: Column(children: [
                GestureDetector(
                  onTap: () {
                    print("The card 1 was clicked");
                  },
                  child: Card(
                    color: secondaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 12,
                    shadowColor: litBlue.withOpacity(0.8),
                    child: Container(
                      width: double.infinity,
                      height: 150.h,
                      decoration: BoxDecoration(
                        color: secondaryBlue,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Students",
                                  style: TextStyle(
                                    color: creamyWhite,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                // SizedBox(height: 5,),
                                Text(
                                  "All registered students",
                                  style: TextStyle(
                                    color: creamyWhite,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.people,
                            color: creamyWhite,
                            size: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                  
                  },
                  child: Card(
                    color: secondaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 12,
                    shadowColor: litBlue.withOpacity(0.8),
                    child: Container(
                      width: double.infinity,
                      height: 150.h,
                      decoration: BoxDecoration(
                        color: secondaryBlue,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Company",
                                style: TextStyle(
                                  color: creamyWhite,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "All registered company",
                                style: TextStyle(
                                  color: creamyWhite,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          Icon(
                            Icons.domain_rounded,
                            color: creamyWhite,
                            size: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  child: Card(
                    color: secondaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 12,
                    shadowColor: litBlue.withOpacity(0.8),
                    child: Container(
                      width: double.infinity,
                      height: 150.h,
                      decoration: BoxDecoration(
                        color: secondaryBlue,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Selected",
                                  style: TextStyle(
                                    color: creamyWhite,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "Students",
                                  style: TextStyle(
                                    color: creamyWhite,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            CustomIcons.verified,
                            color: creamyWhite,
                            size: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      drawer: AdminDrawer(scaffoldKey: _scaffoldKey),
    );
  }
}
