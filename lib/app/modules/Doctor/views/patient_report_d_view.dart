import 'package:doctor_app/app/widget/appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PatientReportView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: appbar('Patient Report', true),
          automaticallyImplyLeading: false,
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/lab.png',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              text(text: '100 Urine Place', size: 15),
              text(text: 'Hot: Springs, MD 10203', size: 15),
              text(text: 'Phone: (555) 555-5555', size: 15),
              text(text: 'CLIAS 12234445', size: 15),
              text(text: 'Lab Director: Vincent Price, MD', size: 15),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ordering Physician:',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          text(text: 'Jackson Gates', size: 14),
                          text(text: '123 Gates  Dr', size: 14),
                          text(text: 'Suite 456', size: 14),
                          text(text: 'Atlanta. GA  30315', size: 14),
                          text(text: 'Phone:  (555) 123-1234', size: 14),
                          text(text: 'Fax:', size: 14),
                          text(text: 'Account Num: AC 00123', size: 14),
                          text(text: 'Order Num: ACD 00456789-12', size: 14),
                        ],
                      ),
                    ),
                    Container(
                      width: Get.width * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Patient Name:',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          text(text: 'Gina Lollobrigide', size: 14),
                          text(text: '24 Hollywood Bivd', size: 14),
                          text(text: 'Hollywood. CA 90125', size: 14),
                          text(text: 'MRN: 1122345', size: 14),
                          text(text: 'Gender: Female', size: 14),
                          text(text: 'DOB: 06/20/1994', size: 14),
                          text(text: 'Collected: 07/30/2013', size: 14),
                          text(text: 'Date Received: 6/30/2014', size: 14),
                          text(text: 'Date Reported: 7/25/2014', size: 14),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Get.theme.primaryColor,
              ),
              Text('Report',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ));
  }

  text({required text, required double size}) {
    return Column(children: [
      SizedBox(
        height: 5,
      ),
      Text(text, style: TextStyle(fontSize: size, color: Colors.grey)),
    ]);
  }
}
