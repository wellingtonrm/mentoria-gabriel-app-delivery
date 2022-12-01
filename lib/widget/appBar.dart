import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/color.dart';
import '../constants/icons.dart';

class AppBarCustom extends AppBar {
  BuildContext context;
  AppBarCustom({
    required this.context,
    Key? key,
  }) : super(
          key: key,
          backgroundColor: color00,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              menuBars,
              color: color02,
              width: 25,
              height: 25,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                user,
                color: color02,
                width: 25,
                height: 25,
              ),
            )
          ],
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
        );
}
