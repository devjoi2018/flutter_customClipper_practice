import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(0, size.height - 20, 0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(size.width - 20, size.height, size.width - 20, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height -20);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width, 20, size.width, 40);
    path.quadraticBezierTo(size.width, 0, size.width - 40, 10);
    path.lineTo(40, size.height / 2 - 60);
    path.quadraticBezierTo(20, size.height / 2 - 60, 40, size.height / 2 - 60);
    path.quadraticBezierTo(0, size.height / 2 - 40, 0, size.height / 2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return null;
  }
}