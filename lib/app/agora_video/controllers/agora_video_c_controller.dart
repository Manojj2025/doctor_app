import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:doctor_app/app/agora_video/agora_connect.dart';
import 'package:get/get.dart';
import 'dart:math';

class AgoraVideoCController extends GetxController {
  final users = <int>[].obs;
  final infoStrings = <String>[].obs;
  final muted = false.obs;
  late RtcEngine engine;
  final role = ClientRole.Broadcaster;
  var rng = new Random();
  var code;
  // final channelName = Get.find<CallPageController>().channelController.text;
  @override
  void onInit() {
    super.onInit(); // initialize agora sdk
    code = rng.nextInt(900000) + 100000;
    print(code.toString() + 'fhueerhuf');
    initialize();
  }

  @override
  void dispose() {
    // clear users
    users.clear();
    // destroy sdk
    engine.leaveChannel();
    engine.destroy();
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  Future<void> initialize() async {
    if (APP_ID.isEmpty) {
      infoStrings.add(
        'APP_ID missing, please provide your APP_ID in settings.dart',
      );
      infoStrings.add('Agora Engine is not starting');

      return;
    }

    await _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    // ignore: deprecated_member_use
    await engine.enableWebSdkInteroperability(true);
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = VideoDimensions(width: 1920, height: 1080);
    await engine.setVideoEncoderConfiguration(configuration);
    await engine.joinChannel(Token, 'd', null, 0);
  }

  /// Create agora sdk instance and initialize
  Future<void> _initAgoraRtcEngine() async {
    engine = await RtcEngine.create(APP_ID);
    await engine.enableVideo();
    await engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await engine.setClientRole(role);
  }

  /// Add agora event handlers
  void _addAgoraEventHandlers() {
    engine.setEventHandler(RtcEngineEventHandler(error: (code) {
      final info = 'onError: $code';
      infoStrings.add(info);
    }, joinChannelSuccess: (channel, uid, elapsed) {
      final info = 'onJoinChannel: $channel, uid: $uid';
      infoStrings.add(info);
    }, leaveChannel: (stats) {
      infoStrings.add('onLeaveChannel');
      users.clear();
    }, userJoined: (uid, elapsed) {
      final info = 'userJoined: $uid';
      infoStrings.add(info);
      users.add(uid);
    }, userOffline: (uid, elapsed) {
      final info = 'userOffline: $uid';
      infoStrings.add(info);
      users.remove(uid);
    }, firstRemoteVideoFrame: (uid, width, height, elapsed) {
      final info = 'firstRemoteVideo: $uid ${width}x $height';
      infoStrings.add(info);
    }));
  }

  void onCallEnd() {
    users.clear();
    // destroy sdk
    engine.leaveChannel();
    engine.destroy();
    // Navigator.pop(context);
    Get.back();
  }

  void onToggleMute() {
    muted.value = !muted.value;

    engine.muteLocalAudioStream(muted.value);
  }

  void onSwitchCamera() {
    engine.switchCamera();
  }
}
