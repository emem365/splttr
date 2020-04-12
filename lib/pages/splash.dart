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
  Future _getData() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  void initState() {
    super.initState();
    //move to home screen:
    // _getData().then((_) => Navigator.of(context).pushReplacement(SlideUpRoute(widget: AppScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.white,

        child: ListView(
          children:[
            Image(
              alignment: Alignment.topCenter,
                image: AssetImage('images/banner.png'),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,

              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      onTap: (){},//scroll view bottom  ,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Username',
                        // hintText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    TextFormField(
                      cursorColor: Theme.of(context).primaryColor,
                      obscureText: true,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Password',
                        // hintText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 75),
                      onPressed: () {},
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Theme.of(context).primaryColor,
                      shape: StadiumBorder(),
                    )
                  ],
                ),
              ),
          ],
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: <Widget>[
        //     Expanded(
        //       flex: 1,
        //       child: 
        //     ),
        //     Expanded(
        //       flex: 1,
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: <Widget>[
        //             TextFormField(
        //               cursorColor: Theme.of(context).primaryColor,
        //               decoration: InputDecoration(
        //                 alignLabelWithHint: true,
        //                 labelText: 'Username',
        //                 // hintText: 'Username',
        //                 border: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(40),
        //                   borderSide: BorderSide(
        //                     style: BorderStyle.solid,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             Padding(
        //               padding: EdgeInsets.symmetric(vertical: 16.0),
        //             ),
        //             TextFormField(
        //               cursorColor: Theme.of(context).primaryColor,
        //               obscureText: true,
        //               decoration: InputDecoration(
        //                 alignLabelWithHint: true,
        //                 labelText: 'Password',
        //                 // hintText: 'Username',
        //                 border: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(40),
        //                   borderSide: BorderSide(
        //                     style: BorderStyle.solid,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             Padding(
        //               padding: EdgeInsets.symmetric(vertical: 16.0),
        //             ),
        //             FlatButton(
        //               padding:
        //                   EdgeInsets.symmetric(vertical: 16, horizontal: 75),
        //               onPressed: () {},
        //               child: Text(
        //                 'Submit',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                 ),
        //               ),
        //               color: Theme.of(context).primaryColor,
        //               shape: StadiumBorder(),
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

// Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     Container(
//                       height: 200,
//                       width: 200,
//                       child: FlareActor(
//                         'animations/loading.flr',
//                         alignment: Alignment.center,
//                         fit: BoxFit.contain,
//                         animation: 'Untitled Duplicate',
//                       ),
//                     ),
//                     Text(
//                       'Loading...',
//                       style: TextStyle(
//                         letterSpacing: 2.0,
//                         // color: Colors.white70,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
