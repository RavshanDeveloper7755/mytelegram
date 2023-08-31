import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const LoginButton({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: GestureDetector(
        onTap: (){
          onTap;
          },
        child: Container(
            width: double.infinity,
            height: 60,
            decoration: ShapeDecoration(
              color: Color(0xFF36B8B8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
        ),
      ),
    );
  }
}
