import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ios_movies/home/upcoming/segmented_control_page.dart';
import 'package:flutter_ios_movies/shared/presentation/base_page.dart';

class UpComingSonPage extends BaseCupertinoPage {
  const UpComingSonPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget content(BuildContext context) {
    return ComingSonRootPage();
  }

  @override
  String title() => 'Up Coming';
}
