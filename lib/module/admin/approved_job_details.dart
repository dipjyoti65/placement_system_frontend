import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:placemnet_system_frontend/constants/constants.dart';
import 'package:placemnet_system_frontend/custom_icons_icons.dart';
import 'package:placemnet_system_frontend/module/Models/job_cart_item.dart';
import 'package:placemnet_system_frontend/module/admin/all_job_screen.dart';
import 'package:placemnet_system_frontend/module/admin/approved_job_screen.dart';
import 'package:placemnet_system_frontend/services/job_services.dart';

class ApprovedJobDetailsScreen extends StatefulWidget {
  final JobCartItem jobCartItem;
  const ApprovedJobDetailsScreen({super.key, required this.jobCartItem});

  @override
  State<ApprovedJobDetailsScreen> createState() => ApprovedJobDetailsScreenState();
}

class ApprovedJobDetailsScreenState extends State<ApprovedJobDetailsScreen> {
  final JobService jobService = JobService();

  void approveJob() {
    jobService.approveJob(context: context, jobId: widget.jobCartItem.jobid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 45, 0, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ApprovedJobs()));
              },
              icon: const Icon(
                CustomIcons.left_circle,
                size: 30,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              alignment: Alignment.center,
              height: 80.h,
              width: MediaQuery.of(context).size.width * .65,
              decoration: const BoxDecoration(
                color: coolBlue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              // Title of the job
              child: Text(
                widget.jobCartItem.title,
                style: const TextStyle(
                  color: primayBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 25.w,
                right: 25.w,
                bottom: 10.h,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * .5,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: secondaryBlue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: coolBlue,
                          width: 2.w,
                        ))),
                        child: const Text(
                          "Job details",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: coolBlue),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 10, right: 10),
                        child: Row(
                          children: [
                            const Icon(
                              CustomIcons.business_time,
                              color: coolBlue,
                              size: 15,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            const Text(
                              "Job type  : ",
                              style: TextStyle(
                                color: coolBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 80.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: coolBlue,
                              ),
                              child: const Text(
                                "Full time",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: primayBlue,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: coolBlue,
                              size: 20,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            const Text(
                              "Location  :",
                              style: TextStyle(
                                color: coolBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 25.w,
                            ),
                            const Text(
                              "Guwahati, Assam",
                              style: TextStyle(
                                color: coolBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Row(
                          children: [
                            Icon(
                              CustomIcons.money,
                              color: coolBlue,
                              size: 16,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Salary       :",
                              style: TextStyle(
                                color: coolBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 28,
                            ),
                            Text(
                              "20 LPA",
                              style: TextStyle(
                                color: coolBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Description : ",
                              style: TextStyle(
                                color: coolBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            SizedBox(
                                width: double.infinity,
                                child: Text(
                                  widget.jobCartItem.description,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      fontSize: 12, color: coolBlue),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
