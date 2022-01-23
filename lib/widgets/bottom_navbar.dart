import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

@immutable
class BottomNavbarItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  const BottomNavbarItem(
      {Key? key, required this.imageUrl, required this.isActive})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
        ),
        const Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 4,
                decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: BorderRadius.circular(1000),
                ),
              )
            : Container(),
      ],
    );
  }
}
