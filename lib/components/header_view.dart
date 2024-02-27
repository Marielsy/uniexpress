import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  final double height;
  final Widget child;

  const HeaderView({
    super.key,
    this.height = 233,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(39, 52, 185, 1),
            Color.fromRGBO(73, 82, 171, 1),
          ],
        ),
      ),
      child: child,
    );
  }
}
