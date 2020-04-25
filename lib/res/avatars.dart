import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Avatars {
  static final List<String> avatarList = [
    'abacus',
    'ambulance',
    'apple',
    'atm',
    'atom',
    'barcode',
    'baseball',
    'basketball',
    'blaster',
    'boarding-ticket',
    'book',
    'bookmark',
    'brain',
    'brush',
    'bulls-eye',
    'car',
    'chemistry',
    'clock',
    'color-card',
    'cycle',
    'directions',
    'drink',
    'einstein',
    'equilizer',
    'factory',
    'ghost',
    'gift',
    'golf-ball',
    'graph',
    'id',
    'living-room',
    'man',
    'map',
    'mario',
    'mobile',
    'mouse',
    'passport',
    'pencil-brush',
    'perfume',
    'post-its',
    'purse',
    'sale',
    'sandels',
    'school-bus',
    'ship',
    'shower',
    'slippers',
    'stove',
    'swipe-card',
    'tap',
    'tetris',
    'travel-bag',
    'truck',
    'umbrella',
    'usb',
    'wallet',
    'water-bottle',
    'windmill',
    'woman',
    'yoga',
  ];

  static String getPathFromName(String name) {
    if (avatarList.contains(name))
      return 'images/avatars/$name.png';
    else
      return null;
  }

  static Widget getAssetFromName(String name) {
    if (getPathFromName(name) != null)
      return Image.asset(getPathFromName(name));
    return Icon(
      FontAwesomeIcons.user,
      color: Colors.white,
    );
  }
}
