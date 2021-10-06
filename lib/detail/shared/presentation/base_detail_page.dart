import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ios_movies/shared/presentation/base_page.dart';

abstract class BaseDetailPage extends BaseCupertinoPage {
  BaseDetailPage({Key? key}) : super(key: key);

  @override
  Widget content(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 500,
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${poster()}",
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Container(
              width: screenWidth,
              child: Column(
                children: <Widget>[
                  Text(
                    title(),
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  Text(description()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String description();

  String poster();
}
