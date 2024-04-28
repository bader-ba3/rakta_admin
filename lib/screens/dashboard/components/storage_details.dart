import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Vehicles Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          StorageInfoCard(
            svgSrc: "assets/car_icon.png",
            title: "Taxi",
            amountOfFiles: "700",
            numOfFiles: 600,
            color: primaryColor.withOpacity(0.5),
          ),
          StorageInfoCard(
            svgSrc: "assets/bus_icon.png",
            title: "Bus",
            amountOfFiles: "375",
            numOfFiles: 325,
            color: Colors.cyan,
          ),
          StorageInfoCard(
            svgSrc: "assets/ferry_icon.png",
            title: "Ferry",
            amountOfFiles: "225",
            numOfFiles: 200,
            color: Colors.green,
          ),
          StorageInfoCard(
            svgSrc: "assets/garage.png",
            title: "Maintenance",
            amountOfFiles: "0",
            numOfFiles: 150,
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}
