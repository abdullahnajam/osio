import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const primaryColor=Color(0xffFFDB7F);
const unselectedColor=Color(0xffADA4A5);
const bgColor=Color(0xffEAE7DF);
const chatColor=Color(0xfff1e6f7);
const color1=Color(0xff9C7431);
const color2=Color(0xff9A9FCE);
const color3=Color(0xff8D2C67);
const greenColor=Color(0xff3BA082);


final f = DateFormat('MMMM dd, yyyy');

Color _baseColor = Color(0xff9A5B83);
Color optionColor = Color(0xff5E2D4D);

LinearGradient discoverVideoGradient=LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    const Color(0x00000000),
    const Color(0x00000000),
    primaryColor.withOpacity(0.3),
    primaryColor.withOpacity(0.5),
  ],
);

List<Color> shades = [
  Color(0xff9A5B83),
  Color(0xff5E2D4D),
  Color(0xff877280),
  Color(0xffc2a9b9),
  Color(0xff3d0e2c),
  Color(0xffa84886),
  Color(0xff362730),
  Color(0xffc20e7a),
  Color(0xff9A5B83),
  Color(0xff5E2D4D),
  Color(0xff877280),
  Color(0xffc2a9b9),
  Color(0xff3d0e2c),
  Color(0xffa84886),
  Color(0xff362730),
  Color(0xffc20e7a),
  Color(0xff9A5B83),
  Color(0xff5E2D4D),
  Color(0xff877280),
  Color(0xffc2a9b9),
  Color(0xff3d0e2c),
  Color(0xffa84886),
  Color(0xff362730),
  Color(0xffc20e7a),
];

List<Color> generateShades(int limit) {
  List<Color> _shades = [];
  for (int i = 1; i <= limit; i++) {
    double opacity = i * 0.2; // Change the value (0.2) to control the darkness of shades
    _shades.add(_baseColor.withOpacity(opacity));
  }
  return _shades;
}

const loremIpsum='Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.Lorem ipsum may be used as a placeholder before final copy is available.';

