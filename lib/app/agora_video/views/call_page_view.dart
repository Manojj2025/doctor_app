import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:doctor_app/app/agora_video/controllers/call_page_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CallPageView extends GetView<CallPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AgoraCall'),
        centerTitle: true,
      ),
      body: Obx(
        () => Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 400,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      controller: controller.channelController,
                      decoration: InputDecoration(
                        errorText: controller.validateError.value
                            ? 'Channel name is mandatory'
                            : null,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                        hintText: 'Channel name',
                      ),
                    ))
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                      title: Text(ClientRole.Broadcaster.toString()),
                      leading: Radio(
                        value: ClientRole.Broadcaster,
                        groupValue: controller.role,
                        onChanged: (ClientRole? value) {
                          controller.role = value;
                        },
                      ),
                    ),
                    // ListTile(
                    //   title: Text(ClientRole.Audience.toString()),
                    //   leading: Radio(
                    //     value: ClientRole.Audience,
                    //     groupValue: controller.role,
                    //     onChanged: (ClientRole? value) {
                    //       controller.role = value;
                    //     },
                    //   ),
                    // )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // var usertype =
                            //     Get.find<SplashController>().usertype;
                            // if (usertype == 'doctor') {
                            //   controller.onJoin();
                            // } else {
                            controller.pushnotificationC();
                            controller.onJoin();
                            // }
                          },
                          child: Text('Join'),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blueAccent),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                        ),
                      ),
                      // Expanded(
                      //   child: RaisedButton(
                      //     onPressed: onJoin,
                      //     child: Text('Join'),
                      //     color: Colors.blueAccent,
                      //     textColor: Colors.white,
                      //   ),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
