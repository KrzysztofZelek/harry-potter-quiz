import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;
  final Color answerColor;
  final Function() onTap;

  const Answer(
      {Key? key,
      required this.answer,
      required this.onTap,
      required this.answerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(12.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: answerColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Text(
          answer,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
