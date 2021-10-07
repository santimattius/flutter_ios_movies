import 'package:flutter/cupertino.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget() : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: CupertinoActivityIndicator()),
    );
  }
}
