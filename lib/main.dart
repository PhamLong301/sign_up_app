import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:sign_up_app/scene/forgot/forgot_scene.dart';
import 'package:sign_up_app/scene/main_scenes/home_scene.dart';
import 'package:sign_up_app/scene/main_scenes/login_scene.dart';
import 'package:sign_up_app/scene/sign_up/register_scene.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_webrtc/flutter_webrtc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (WebRTC.platformIsDesktop) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((_) {
  //   runApp(const MyApp());
  // });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<InternetConnectionStatus>(
        initialData: InternetConnectionStatus.connected,
        create: (_) {
          return InternetConnectionChecker().onStatusChange;
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const LoginScene(),
          routes: {
            LoginScene.routeName: (ctx) => const LoginScene(),
            // ignore: equal_keys_in_map
            HomeScene.routeName1: (ctx) => const HomeScene(),
            ForgotScene.routeName2: (ctx) => const ForgotScene(),
            RegisterScene.routeName3: (ctx) => const RegisterScene(),
          },
        ));
  }
}
