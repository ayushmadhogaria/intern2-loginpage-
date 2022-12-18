// ignore: file_names
import 'package:flutter/material.dart';

class CurvePath extends StatelessWidget {
  const CurvePath({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            color: const Color.fromARGB(255, 48, 169, 255),
            height: 350,
          ),
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 200),
            child: Text(
              "Log In",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
          ),
        ),
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 2);
    path.cubicTo(size.width / 5, 3 * (size.height / 2), 3 * (size.width / 4),
        size.height / 2, size.width, size.height * 0.9);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
