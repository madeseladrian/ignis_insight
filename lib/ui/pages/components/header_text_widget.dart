import 'package:flutter/material.dart';

class HeaderTextWidget extends StatelessWidget {
  final String name;
  final Function() onTap;

  const HeaderTextWidget({Key? key, 
    required this.name,
    required this.onTap
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Text(
            name.toUpperCase(),
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 7, 10, 0),
          child: Container(
            height: 2,
            width: 40,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}