import 'package:flutter/material.dart';

class TextFieldView extends StatelessWidget {
  final String title;
  final String placeholder;
  final bool obscureText;

  const TextFieldView({
    super.key,
    required this.title,
    required this.placeholder,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              filled: true,
              fillColor: const Color.fromRGBO(236, 236, 236, 1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              hintText: placeholder,
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(23, 18, 25, 0.6),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
