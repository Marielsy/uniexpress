import 'package:flutter/material.dart';
import 'package:uniexpress/utils/constants.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isTransparent;
  final Function()? onPressed;

  const CustomButton({
    super.key,
    required this.title,
    this.isTransparent = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return (!isTransparent)
                  ? Colors.white.withOpacity(0.1)
                  : Constants.primaryColor.withOpacity(0.1);
            },
          ),
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return (!isTransparent)
                    ? Constants.primaryColor.withOpacity(0.5)
                    : Colors.transparent;
              }
              return (!isTransparent)
                  ? Constants.primaryColor
                  : Colors.transparent;
            },
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: (!isTransparent) ? Colors.white : Constants.primaryColor,
          ),
        ),
      ),
    );
  }
}
