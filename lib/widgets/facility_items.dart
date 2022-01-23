import 'package:flutter/material.dart';
import 'package:bwa_cozy/theme.dart';

class FacilityItems extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int total;

  const FacilityItems(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        const SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: '$total  ',
            style: purpleTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: name,
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
