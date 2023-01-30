// ignore_for_file: unused_import, depend_on_referenced_packages, library_private_types_in_public_api, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:sip_ua/sip_ua.dart';
import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter_webrtc/flutter_webrtc.dart';



import '../../widgets/about_widget.dart';
import '../../widgets/callscreen_widget.dart';
import '../../widgets/dialpad_widget.dart';
import '../../widgets/register_sip_widget.dart';

typedef PageContentBuilder = Widget Function(
    [SIPUAHelper? helper, Object? arguments]);

class DialPadScene extends StatefulWidget {


  DialPadScene({super.key});

  @override
  _DialPadSceneState createState() => _DialPadSceneState();
}

class _DialPadSceneState extends State<DialPadScene> {
  final SIPUAHelper _helper = SIPUAHelper();

  Map<String, PageContentBuilder> routes = {
    '/': ([SIPUAHelper? helper, Object? arguments]) => DialPadWidget(helper),
    '/register': ([SIPUAHelper? helper, Object? arguments]) => RegisterWidget(helper),
    '/callscreen': ([SIPUAHelper? helper, Object? arguments]) => CallScreenWidget(helper, arguments as Call?),
    '/about': ([SIPUAHelper? helper, Object? arguments]) => const AboutWidget(),
  };

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;
    final PageContentBuilder? pageContentBuilder = routes[name!];
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        final Route route = MaterialPageRoute<Widget>(
            builder: (context) =>
                pageContentBuilder(_helper, settings.arguments));
        return route;
      } else {
        final Route route = MaterialPageRoute<Widget>(
            builder: (context) => pageContentBuilder(_helper));
        return route;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: _onGenerateRoute,
    );
  }
}
