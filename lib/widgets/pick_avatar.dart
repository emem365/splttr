import 'package:flutter/material.dart';
import 'package:splttr/res/avatars.dart';

class PickAvatar extends StatelessWidget {
  final double radius;
  final String avatar;
  final String text;
  final void Function() onTap;

  const PickAvatar({
    Key key,
    @required this.radius,
    this.avatar,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(
            radius,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: radius * 2,
            width: radius * 2,
            child: Stack(
              children: <Widget>[
                Center(child: Avatars.getAssetFromName(avatar ?? '')),
                Positioned(
                  top: (radius * 2) - (radius/1.5),
                  child: Container(
                    height: radius/1.5,
                    width: radius * 2,
                    color: Colors.black26,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            text ?? 'Edit',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white70,
                            ),
                          ),
                          Icon(
                            Icons.edit,
                            size: 14.0,
                            color: Colors.white70,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}