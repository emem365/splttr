import 'package:flutter/material.dart';
import 'package:splttr/widgets/empty_list_message.dart';
import 'package:splttr/widgets/two_button_row.dart';

class AppScreenTitleWithImageWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final TwoButtonRow buttonRow;
  final bool showEmptyListMessage;
  final EmptyListEmoticonMessage message;

  AppScreenTitleWithImageWidget({
    this.imagePath,
    this.title,
    this.buttonRow,
    this.showEmptyListMessage,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(32),
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.width / 3,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline5.copyWith(
                  fontFamily: 'Montserrat',
                ),
          ),
          SizedBox(height: 16),
          buttonRow,
          (showEmptyListMessage)
              ? message
              : null,
        ].where((widget) => widget != null).toList(),
      ),
    );
  }
}
