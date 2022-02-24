import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:doctor_app/app/constants/values.dart';
import 'package:doctor_app/app/modules/patient/controllers/doctor_appointment_controller.dart';
import 'package:doctor_app/app/modules/patient/views/bookappointment_view.dart';
import 'package:doctor_app/app/widget/appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widget/toast.dart';
import 'doctor_profile_view.dart';

class TimeSlotsView extends GetView<DoctorAppointmentController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DoctorAppointmentController());
    // print(controller.select_time.value.toString() + 'manoj');
    // print(controller.selectedDay.value.toString() + 'manoj');
    print(controller.select_time.value.toString() + 'manoj');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appbar('Time Slots', true),
        centerTitle: false,
      ),
      bottomNavigationBar: Obx(
        () => controller.selectedDay.value == 0 ||
                controller.select_time.value == ''
            ? Container(
                height: 0.0,
                width: 0.0,
              )
            : Material(
                elevation: 5.0,
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 70.0,
                  padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                  alignment: Alignment.center,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    onTap: () {
                      // controller.symptomsC();
                      if (controller.select_time.value == '') {
                        showToast('Please select Your Time');
                      } else {
                        Get.to(
                          BookappointmentView(),
                          arguments: {
                            'doctor': controller.doctordata,
                            'date': controller.selectedDateTime,
                            'time': controller.select_time.value,
                            'url': controller.doctorimagepath,
                          },
                        );
                      }

                      // Navigator.push(
                      //     context,
                      //     PageTransition(
                      //         type: PageTransitionType.rightToLeft,
                      //         duration: Duration(milliseconds: 600),
                      //         child: ConsultationDetail(
                      //           doctorName: widget.doctorName,
                      //           doctorType: widget.doctorType,
                      //           doctorExp: widget.experience,
                      //           doctorImage: widget.doctorImage,
                      //           date: selectedDate,
                      //           time: selectedTime,
                      //         )));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: AppColors.maincolor,
                      ),
                      child: Text(
                        'Continue',
                        style: BaseStyles.whiteBold15,
                      ),
                    ),
                  ),
                ),
              ),
      ),
      body: Obx(
        () => Column(
          children: [
            Material(
              elevation: 1.0,
              child: Container(
                color: AppColors.whiteColor,
                padding: EdgeInsets.only(top: fixPadding * 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          controller.loading.value
                              ? CircularProgressIndicator()
                              : Container(
                                  width: 76.0,
                                  height: 76.0,
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(38.0),
                                    border: Border.all(
                                        width: 0.3, color: AppColors.maincolor),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        blurRadius: 1.0,
                                        spreadRadius: 1.0,
                                        color: Colors.grey.withOpacity(0.3),
                                      ),
                                    ],
                                    image: DecorationImage(
                                      scale: 1.5,
                                      image: NetworkImage(
                                        '${controller.doctorimagepath}/${controller.doctordata['profileImage'].toString()}',
                                      ),
                                      fit: BoxFit.fitHeight,
                                      // scale: 5,
                                    ),
                                  ),
                                ),
                          widthSpace10,
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Dr.${controller.doctordata['username'].toString()}",
                                        style: BaseStyles.blackBold13,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Wrap(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            // print(controller.data);
                                            Get.to(
                                              DoctorProfileView(),
                                              arguments: {
                                                'doctor': controller.doctordata,
                                                'url':
                                                    controller.doctorimagepath
                                              },
                                            );
                                          },
                                          child: Text(
                                            'View Profile',
                                            style: BaseStyles.blackBold13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 7.0),
                                Text(
                                  '${controller.doctordata['education'].toString()}',
                                  style: BaseStyles.blackBold13,
                                ),
                                SizedBox(height: 7.0),
                                Text(
                                  '${controller.doctordata['experience'].toString()}',
                                  style: BaseStyles.blackBold13,
                                ),
                                SizedBox(height: 7.0),
                                Text(
                                  '\₹${controller.doctordata['amount'].toString()} consultation charge',
                                  style: BaseStyles.blackBold13,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    heightSpace20,
                    Container(
                      height: 100,
                      child: DatePicker(
                        DateTime.now(),
                        key: controller.forceRender.value
                            ? UniqueKey()
                            : Key('Calendar'),
                        width: 60,
                        height: 80,
                        daysCount: 30,
                        controller: controller.controller,
                        // initialSelectedDate: DateTime.now(),
                        selectionColor: AppColors.maincolor,
                        selectedTextColor: Colors.white,
                        locale: 'en',
                        inactiveDates: [
                          // DateTime.now().add(Duration(days: 3)),
                          // DateTime.now().add(Duration(days: 4)),
                          // DateTime.now().add(Duration(days: 7))
                        ],
                        onDateChange: (date) {
                          controller.selectedDay.value = date.day;
                          controller.selectedMonth.value = date.month;
                          controller.selectedValue = date;
                          controller.start_time.value = '';
                          controller.setSelectedDateTime();

                          // print(controller.selectedDay.value.toString());
                          // print(controller.selectedMonth.value.toString());
                          // New date selected
                          // setState(() {
                          //   _selectedValue = date;
                          // });
                        },
                      ),
                    )

                    //         CalendarTimeline(
                    //           key: controller.forceRender.value
                    //               ? UniqueKey()
                    //               : Key('Calendar'),
                    //           showYears: false,
                    //           initialDate: DateTime.now(),
                    //           firstDate: controller.firstDate,
                    //           lastDate: controller.lastDate,
                    //           onDateSelected: (e) async {
                    //             controller.selectedDay.value = e!.day;
                    //             controller.selectedMonth.value = e.month;
                    //             controller.setSelectedDateTime();
                    //             print(controller.selectedDay.value.toString());
                    //             print(controller.selectedMonth.value.toString());
                    //           },
                    //           leftMargin: 20,
                    //           monthColor: Colors.black,
                    //           dayColor: AppColors.blackColor,
                    //           dayNameColor: Color(0xFF333A47),
                    //           activeDayColor: Colors.white,
                    //           activeBackgroundDayColor: AppColors.maincolor,
                    //           dotsColor: Colors.white,
                    //           // selectableDayPredicate: (date) => date.day != 23,
                    //           locale: 'en',
                    // ),
                  ],
                ),
              ),
            ),
            heightSpace20,
            Expanded(
              child: Wrap(
                spacing: 10.0,
                runSpacing: 20.0,
                children: List.generate(controller.doctorslot.length, (index) {
                  var item = controller.doctorslot[index];

                  return GestureDetector(
                    onTap: () {
                      if (controller.status[index] == '0') {
                        controller.start_time.value = item['startTime'];
                        var Stime = item['startTime'];
                        var Etime = item['endTime'];
                        controller.select_time.value =
                            '${Stime.toString() + ' ' 'To' ' ' + Etime.toString()}';
                        print(controller.status[index]);
                        print(controller.select_time.value);
                      } else {
                        controller.start_time.value = '';
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        color: controller.status[index] == '1' ||
                                controller.start_time.value == item['startTime']
                            ? AppColors.maincolor
                            : AppColors.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            width: 0.5,
                            color: AppColors.maincolor.withAlpha(200)),
                      ),
                      child: Text(
                        '${item['startTime'].toString()} To ${item['endTime'].toString()}',
                        style: controller.status[index] == '1' ||
                                controller.start_time.value == item['startTime']
                            ? BaseStyles.whiteBold13
                            : BaseStyles.mainMedium13,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
