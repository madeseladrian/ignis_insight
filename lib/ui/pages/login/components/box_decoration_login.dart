import 'package:flutter/material.dart';

final Decoration boxImage = BoxDecoration(
  image: DecorationImage(
    image: const AssetImage('assets/images/i.jpg'),
    fit: BoxFit.cover,
    colorFilter: ColorFilter.mode(
      Colors.black.withOpacity(0.56), 
      BlendMode.darken
    )
  )
);