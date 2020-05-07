import 'package:flutter/material.dart';
import 'package:splttr/res/colors.dart';

enum Emotion {
  sad,
  happy,
}

class EmptyListEmoticonMessage extends StatelessWidget {
  final String message;
  final Emotion emotion;
  const EmptyListEmoticonMessage({
    this.message,
    this.emotion,
  });
  Image get imageFromEmotion {
    switch (emotion) {
      case Emotion.sad:
        return Image.asset(
          'images/sad.png',
          fit: BoxFit.cover,
        );
      case Emotion.happy:
        return Image.asset(
          'images/smile.png',
          fit: BoxFit.cover,
        );
      default:
        return null;
    }
  }

  Color get _colorFromEmotion {
    switch (emotion) {
      case Emotion.sad:
        return CurrencyColors.lossColor;
      case Emotion.happy:
        return CurrencyColors.profitColor;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.width / 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          (imageFromEmotion == null)
              ? null
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: imageFromEmotion,
                  ),
                ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1.apply(
                  color: _colorFromEmotion,
                  fontFamily: 'Montserrat',
                ),
          ),
        ].where((widget) => widget!=null).toList(),
      ),
    );
  }
}
