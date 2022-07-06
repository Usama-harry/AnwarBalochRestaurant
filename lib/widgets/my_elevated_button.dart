import 'package:flutter/material.dart';

//Util
import '../utils/text_styles.dart';

class MyElevatedButton extends StatelessWidget {
  final String text;
  final Function() function;
  const MyElevatedButton({
    Key? key,
    required this.text,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 40,
        ),
        child: ElevatedButton(
          onPressed: function,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
          ),
          child: Text(
            text,
            style: getStartedElevatedButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
