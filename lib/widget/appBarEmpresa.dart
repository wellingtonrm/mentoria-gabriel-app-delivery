import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/color.dart';
import '../constants/icons.dart';

class AppBarEmpresa extends AppBar {
  BuildContext context;
  AppBarEmpresa({
    required this.context,
    Key? key,
  }) : super(
          key: key,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: color00,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.star_outline,
                color: color00,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_rounded,
                color: color00,
              ),
            ),
          ],
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
        );
}
