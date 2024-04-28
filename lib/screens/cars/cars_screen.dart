import 'package:rakta_admin/models/RecentFile.dart' hide demoRecentFiles;
import 'package:rakta_admin/responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'package:rakta_admin/controller/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'line_chart.dart';

class CarsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: GetBuilder<HomeController>(builder: (controller) {
            return Column(
              children: [
                Row(
                  children: [
                    if (!Responsive.isDesktop(context))
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: controller.controlMenu,
                      ),
                    if (!Responsive.isMobile(context))
                      Text(
                        "Cars",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    if (!Responsive.isMobile(context)) Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        fillColor: secondaryColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(defaultPadding * 0.75),
                            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: SvgPicture.asset("assets/icons/Search.svg"),
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
                SizedBox(height: defaultPadding),
                LineCarChart(isShowingMainData: true,),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          height: 200,
                          width: 450,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: secondaryColor),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: Stack(
                                  children: [
                                    PieChart(
                                      PieChartData(
                                        sectionsSpace: 0,
                                        centerSpaceRadius: 70,
                                        startDegreeOffset: -90,
                                        sections: paiChartSelectionData,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: defaultPadding),
                                          Text(
                                            "1262",
                                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  height: 0.5,
                                                ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("of 1500")
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                                child: Text(
                                              "Working Car",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 16),
                                            )),
                                          ),
                                        ),
                                        Text(
                                          "1262",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                                child: Text(
                                              "Stopped Car",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 16),
                                            )),
                                          ),
                                        ),
                                        Text(
                                          "88",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                                child: Text(
                                              "maintenance Car",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 16),
                                            )),
                                          ),
                                        ),
                                        Text(
                                          "50",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      squrWidget("order waiting driver confirm", "100"),
                      squrWidget("current Trip", "150"),
                      squrWidget("available car working", "50"),
                      squrWidget("stoped Car", "300"),
                      squrWidget("Total fuel consumption", "500L"),
                      squrWidget("Average fuel consumption", "30L"),
                    ],
                  ),
                ),
                SizedBox(height: defaultPadding),

                Container(
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "All Cars",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          columnSpacing: defaultPadding,
                          // minWidth: 600,
                          columns: [

                            DataColumn(
                              label: Text("Car Type"),
                            ),
                            DataColumn(
                              label: Text("Driver Name"),
                            ),
                            DataColumn(
                              label: Text("Number of Trip"),
                            ),
                            DataColumn(
                              label: Text("Total Income"),
                            ),

                            DataColumn(
                              label: Text("Status"),
                            ),

                          ],
                          rows: List.generate(
                            listWorkingDriver.length,
                            (index) => workingDriverDataRow(listWorkingDriver[index]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget squrWidget(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: secondaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                )),
              ),
            ),
            Text(
              body,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  DataRow workingDriverDataRow(({String carType,String fullCarName,String driverName, String numberOfTrip, String totalIncome, String Status}) record) {
    return DataRow(
      cells: [

        DataCell(
          SizedBox(
            width: 200,
            child: Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 60,
                  child: Image.asset(
                      record.carType == "Tesla"
                          ?"assets/Tesla.png":record.carType == "Toyota"?"assets/Toyota.png":"assets/higer.png"),
                ),
                SizedBox(width: 5,),
                Text(record.fullCarName),
              ],
            ),
          ),
        ),
        DataCell(Text(record.driverName)),
        DataCell(Text(record.numberOfTrip)),
        DataCell(Text(
          record.totalIncome,
        )),
        DataCell(Text(
          record.Status,
          style: TextStyle(color: record.Status == "Working" ? Colors.green : Colors.red),
        )),
      ],
    );
  }

  List<({String carType,String fullCarName,String driverName, String numberOfTrip, String totalIncome, String Status})> listWorkingDriver = [
    (carType:"Tesla",driverName:"Driver Name",fullCarName: "Tesla Model X", numberOfTrip: "12", totalIncome: "4532 AED", Status: "Working"),
    (carType:"Higer",driverName:"Driver Name",fullCarName: "Higer 2020", numberOfTrip: "12", totalIncome: "1375 AED", Status: "in carriage"),
    (carType:"Toyota",driverName:"Driver Name",fullCarName: "Toyota 2022", numberOfTrip: "12", totalIncome: "753 AED", Status: "In maintenance"),
    (carType:"Higer",driverName:"Driver Name",fullCarName: "Higer 2020", numberOfTrip: "12", totalIncome: "1024 AED", Status: "in carriage"),
    (carType:"Higer",driverName:"Driver Name",fullCarName: "Higer 2020", numberOfTrip: "12", totalIncome: "712 AED", Status: "Working"),
    (carType:"Tesla",driverName:"Driver Name",fullCarName: "Tesla Model X", numberOfTrip: "12", totalIncome: "2435 AED", Status: "Working"),
    (carType:"Toyota",driverName:"Driver Name",fullCarName: "Toyota 2022", numberOfTrip: "12", totalIncome: "4572 AED", Status: "Working"),
    (carType:"Tesla",driverName:"Driver Name",fullCarName: "Tesla Model X", numberOfTrip: "12", totalIncome: "764 AED", Status: "in carriage"),
    (carType:"Tesla",driverName:"Driver Name",fullCarName: "Tesla Model X", numberOfTrip: "12", totalIncome: "350 AED", Status: "Working"),
    (carType:"Higer",driverName:"Driver Name",fullCarName: "Higer 2020", numberOfTrip: "12", totalIncome: "380 AED", Status: "Working"),
    (carType:"Tesla",driverName:"Driver Name",fullCarName: "Tesla Model X", numberOfTrip: "12", totalIncome: "1347 AED", Status: "Working"),
    (carType:"Toyota",driverName:"Driver Name",fullCarName: "Toyota 2022", numberOfTrip: "12", totalIncome: "2457 AED", Status: "In maintenance"),
    (carType:"Tesla",driverName:"Driver Name",fullCarName: "Tesla Model X", numberOfTrip: "12", totalIncome: "1430 AED", Status: "in carriage"),
    (carType:"Higer",driverName:"Driver Name",fullCarName: "Higer 2020", numberOfTrip: "12", totalIncome: "1240 AED", Status: "Working"),
    (carType:"Toyota",driverName:"Driver Name",fullCarName: "Toyota 2022", numberOfTrip: "12", totalIncome: "753 AED", Status: "Working"),
    (carType:"Tesla",driverName:"Driver Name",fullCarName: "Tesla Model X", numberOfTrip: "12", totalIncome: "954 AED", Status: "In maintenance"),
    (carType:"Toyota",driverName:"Driver Name",fullCarName: "Toyota 2022", numberOfTrip: "12", totalIncome: "500 AED", Status: "Working"),
    (carType:"Toyota",driverName:"Driver Name",fullCarName: "Toyota 2022", numberOfTrip: "12", totalIncome: "3552 AED", Status: "in carriage"),
    (carType:"Tesla",driverName:"Driver Name",fullCarName: "Tesla Model X", numberOfTrip: "12", totalIncome: "605 AED", Status: "In maintenance"),
  ];

  List<PieChartSectionData> paiChartSelectionData = [
    PieChartSectionData(
      color: Colors.teal.withOpacity(0.5),
      value: 50,
      showTitle: false,
      radius: 20,
    ),
    PieChartSectionData(
      color: Colors.cyan,
      value: 1262,
      showTitle: false,
      radius: 20,
    ),
    PieChartSectionData(
      color: Colors.green.withOpacity(0.5),
      value: 188,
      showTitle: false,
      radius: 20,
    ),
  ];

  List<PieChartSectionData> StatusChartSelectionData = [

    PieChartSectionData(
      color: Colors.cyan,
      value: 45,
      showTitle: false,
      radius: 20,
    ),
    PieChartSectionData(
      color: Colors.pink.withOpacity(0.5),
      value: 55,
      showTitle: false,
      radius: 20,
    ),
  ];
}
