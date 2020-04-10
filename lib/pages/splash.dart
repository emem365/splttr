import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:splttr/res/colors.dart';
import 'dart:async';
import 'package:splttr/main.dart';
import 'package:splttr/res/slide_up_transition.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future _getData() async{
    await Future.delayed(
      Duration(seconds: 3)
    );
  }
  @override
  void initState() {
    super.initState();
    _getData().then((_) => Navigator.of(context).pushReplacement(SlideUpRoute(widget: AppScreen())));
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: PurpleTheme.darkPurple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  'SPLTTR',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 72.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 200,
                      width: 200,
                      child: FlareActor(
                        'animations/loading.flr',
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        animation: 'Untitled',
                      ),
                    ),
                    Text(
                      'Loading...',
                      style: TextStyle(
                        letterSpacing: 2.0,
                        // color: Colors.white70,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
