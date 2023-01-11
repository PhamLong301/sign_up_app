import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sip_ua/sip_ua.dart';
import 'action_button.dart';

class DialPadWidget extends StatefulWidget {
  final SIPUAHelper? _helper;
  const DialPadWidget(this._helper, {Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _MyDialPadWidget createState() => _MyDialPadWidget();
}

class _MyDialPadWidget extends State<DialPadWidget>
    implements SipUaHelperListener {
  String? _dest;
  SIPUAHelper? get helper => widget._helper;
  TextEditingController? _textController;
  late SharedPreferences _preferences;

  String? receivedMsg;

  @override
  initState() {
    super.initState();
    receivedMsg = "";
    _bindEventListeners();
    _loadSettings();
  }

  void _loadSettings() async {
    _preferences = await SharedPreferences.getInstance();
    _dest = _preferences.getString('dest') ?? '';
    _textController = TextEditingController(text: _dest);
    _textController!.text = _dest!;

    setState(() {});
  }

  void _bindEventListeners() {
    helper!.addSipUaHelperListener(this);
  }

  Future<Widget?> _handleCall(BuildContext context,
      [bool voiceOnly = false]) async {
    var dest = _textController?.text;
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      await Permission.microphone.request();
      await Permission.camera.request();
    }
    if (dest == null || dest.isEmpty) {
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Target is empty.'),
            content: const Text('Please enter a SIP URI or username!'),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return null;
    }

    final mediaConstraints = <String, dynamic>{'audio': true, 'video': true};

    MediaStream mediaStream;

    if (kIsWeb && !voiceOnly) {
      mediaStream =
          await navigator.mediaDevices.getDisplayMedia(mediaConstraints);
      mediaConstraints['video'] = false;
      MediaStream userStream =
          await navigator.mediaDevices.getUserMedia(mediaConstraints);
      mediaStream.addTrack(userStream.getAudioTracks()[0], addToNative: true);
    } else {
      mediaConstraints['video'] = !voiceOnly;
      mediaStream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
    }

    helper!.call(dest, voiceonly: voiceOnly, mediaStream: mediaStream);
    _preferences.setString('dest', dest);
    return null;
  }

  void _handleBackSpace([bool deleteAll = false]) {
    var text = _textController!.text;
    if (text.isNotEmpty) {
      setState(() {
        text = deleteAll ? '' : text.substring(0, text.length - 1);
        _textController!.text = text;
      });
    }
  }

  void _handleNum(String number) {
    setState(() {
      _textController!.text += number;
    });
  }

  List<Widget> _buildNumPad() {
    var labels = [
      [
        {'1': ''},
        {'2': 'abc'},
        {'3': 'def'},
      ],
      [
        {'4': 'ghi'},
        {'5': 'jkl'},
        {'6': 'mno'},
      ],
      [
        {'7': 'pqrs'},
        {'8': 'tuv'},
        {'9': 'wxyz'},
      ],
      [
        {'*': ''},
        {'0': '+'},
        {'#': ''},
      ],
    ];

    return labels
        .map((row) => Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: row
                    .map((label) => ActionButton(
                          title: label.keys.first,
                          subTitle: label.values.first,
                          onPressed: () => _handleNum(label.keys.first),
                          number: true,
                        ))
                    .toList())))
        .toList();
  }

  List<Widget> _buildDialPad() {
    return [
      const SizedBox(
        height: 15,
      ),
      SizedBox(
          width: 380,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: 380,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 30, color: Colors.black54),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: _textController,
                    )),
              ])),
      const SizedBox(
        height: 15,
      ),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
          width: 370,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildNumPad())),
      const SizedBox(
        height: 15,
      ),
      SizedBox(
          width: 300,
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // ActionButton(
                  //   icon: Icons.videocam,
                  //   onPressed: () => _handleCall(context),
                  // ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  ActionButton(
                    icon: Icons.dialer_sip,
                    fillColor: Colors.green,
                    onPressed: () => _handleCall(context, true),
                  ),
                  ActionButton(
                    icon: Icons.keyboard_arrow_left,
                    onPressed: () => _handleBackSpace(),
                    onLongPress: () => _handleBackSpace(true),
                  ),
                ],
              )))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton<String>(
                onSelected: (String value) {
                  switch (value) {
                    case 'account':
                      Navigator.pushNamed(context, '/register');
                      break;
                    case 'about':
                      Navigator.pushNamed(context, '/about');
                      break;
                    default:
                      break;
                  }
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black87,
                ),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      PopupMenuItem(
                        value: 'account',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Icon(
                                Icons.account_circle,
                                color: Colors.black38,
                              ),
                            ),
                            SizedBox(
                              width: 69,
                              child: Text('Account'),
                            )
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'about',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const <Widget>[
                            Icon(
                              Icons.info,
                              color: Colors.black38,
                            ),
                            SizedBox(
                              width: 69,
                              child: Text('About'),
                            ),
                          ],
                        ),
                      )
                    ]),
          ],
        ),
        body: SingleChildScrollView(
            // alignment: const Alignment(10, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Center(
                    child: Text(
                  'Status: ${EnumHelper.getName(helper!.registerState.state)}',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Center(
                    child: Text(
                  'Received Message: $receivedMsg',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildDialPad(),
              ),
            ])));
  }

  @override
  void registrationStateChanged(RegistrationState state) {
    setState(() {});
  }

  @override
  void transportStateChanged(TransportState state) {}

  @override
  void callStateChanged(Call call, CallState callState) {
    if (callState.state == CallStateEnum.CALL_INITIATION) {
      Navigator.pushNamed(context, '/callscreen', arguments: call);
    }
  }

  @override
  void onNewMessage(SIPMessageRequest msg) {
    //Save the incoming message to DB
    String? msgBody = msg.request.body as String?;
    setState(() {
      receivedMsg = msgBody;
    });
  }

  @override
  void onNewNotify(Notify ntf) {}
}
