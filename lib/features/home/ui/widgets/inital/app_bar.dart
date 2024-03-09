import 'package:flutter/material.dart';
import 'package:slash/core/theme/my_fonts.dart';

var appBar = AppBar(
  leading: IconButton(
    onPressed: () {},
    icon: const Icon(
      Icons.arrow_back,
      color: Colors.white,
    ),
  ),
  centerTitle: true,
  title: Text(
    'Slash.',
    style: MyFonts.font28WhiteBold,
  ),
);
