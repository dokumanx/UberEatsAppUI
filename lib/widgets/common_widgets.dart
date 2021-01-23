import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:uber_eats_ui/theme/colors.dart';
import 'package:uber_eats_ui/theme/styles.dart';

class MenuCustomDetails extends StatelessWidget {
  final Map content;

  const MenuCustomDetails({this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content["description"],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: customIconContainerStyle,
                child: Icon(
                  LineIcons.hourglass_half,
                  size: 20,
                  color: primary,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: customIconContainerStyle,
                child: Text(content["time"]),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: customIconContainerStyle,
                child: Row(
                  children: [
                    Text(content["rate"]),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      LineIcons.star,
                      size: 15,
                      color: yellowStar,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(content["rate_number"]),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
