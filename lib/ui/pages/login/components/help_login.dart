import 'package:flutter/material.dart';

class HelpLogin extends StatelessWidget {
  final String text;
  final String routeText;
  final Function() onTap;

  const HelpLogin({Key? key, 
    required this.text, 
    required this.routeText, 
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Row(
        children: <Widget>[
          Text(
            '$text ',
            style: const TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.grey,
              fontSize: 15
            ),
          ),
          TextButton(
            onPressed: onTap, 
            child: Text(
              routeText,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 15
              ),
            ),
          )
        ],
      ),
    );
  }
}