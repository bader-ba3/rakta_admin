import 'package:rakta_admin/models/RecentFile.dart' hide demoRecentFiles;
import 'package:rakta_admin/responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'package:rakta_admin/controller/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'driver_details_bus.dart';
import 'line_chart_bus.dart';

class BusesScreen extends StatelessWidget {
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
                        "Bus",
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
                LineBusChart(
                  isShowingMainData: true,
                ),
                SizedBox(height: defaultPadding),
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
                      squrWidget("Bus waiting on station", "100"),
                      squrWidget("current Trip", "150"),
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
                                        sections: BusTicketChartSelectionData,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: defaultPadding),
                                          Text(
                                            "600",
                                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  height: 0.5,
                                                ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Bus")
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
                                              "All Ticket sold",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 16),
                                            )),
                                          ),
                                        ),
                                        Text(
                                          "510",
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
                                              "some Ticket sold",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 16),
                                            )),
                                          ),
                                        ),
                                        Text(
                                          "90",
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
                      squrWidget("available Bus working", "50"),
                      squrWidget("stopped Bus", "300"),
                      squrWidget("Maintenance Bus", "300"),
                      squrWidget("Total Ticket Today", "2000"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
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
                        "Recent Trips",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          columnSpacing: defaultPadding,
                          // minWidth: 600,
                          columns: [
                            DataColumn(
                              label: Text("Trip type"),
                            ),
                            DataColumn(
                              label: Text("Date"),
                            ),
                            DataColumn(
                              label: Text("Distance"),
                            ),
                            DataColumn(
                              label: Text("Total Tickets"),
                            ),
                          ],
                          rows: List.generate(
                            listRecentTrip.length,
                            (index) => recentTripDataRow(listRecentTrip[index]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
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
                        "All Driver",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          columnSpacing: defaultPadding,
                          // minWidth: 600,
                          columns: [
                            DataColumn(
                              label: Text("Driver Name"),
                            ),
                            DataColumn(
                              label: Text("Number of Trip"),
                            ),
                            DataColumn(
                              label: Text("Total Distance"),
                            ),
                            DataColumn(
                              label: Text("Status"),
                            ),
                            DataColumn(
                              label: Text("Details"),
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

  DataRow recentTripDataRow(RecentFile fileInfo) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Container(
                // decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                // padding: EdgeInsets.all(8),
                child: Image.asset(
                  fileInfo.icon!,
                  height: 30,
                  width: 30,
                  // color: fileInfo.title == "Taxi"
                  //     ? primaryColor.withOpacity(0.5)
                  //     : fileInfo.title == "Bus"
                  //         ? Colors.cyan
                  //         : Colors.green,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(fileInfo.title!),
              ),
            ],
          ),
        ),
        DataCell(Text(fileInfo.date!)),
        DataCell(Text(fileInfo.size!)),
        DataCell(Text(fileInfo.totalTicket!)),
      ],
    );
  }

  List listRecentTrip = [
    RecentFile(
      icon: "assets/bus_icon.png",
      title: "Rak -> Ajman",
      date: "01-03-2021",
      size: "3.5KM",
      totalTicket: "30 Ticket",
    ),
    RecentFile(
      icon: "assets/bus_icon.png",
      title: "Rak -> Dubai",
      date: "27-02-2021",
      size: "19.0KM",
      totalTicket: "30 Ticket",
    ),
    RecentFile(
      icon: "assets/bus_icon.png",
      title: "Rak -> Oman",
      date: "25-02-2021",
      size: "3.5KM",
      totalTicket: "30 Ticket",
    ),
    RecentFile(
      icon: "assets/bus_icon.png",
      title: "Rak -> Dubai",
      date: "25-02-2021",
      size: "3.5KM",
      totalTicket: "30 Ticket",
    ),
    RecentFile(
      icon: "assets/bus_icon.png",
      title: "Rak -> AlAeen",
      date: "25-02-2021",
      size: "3.5KM",
      totalTicket: "30 Ticket",
    ),
    RecentFile(
      icon: "assets/bus_icon.png",
      title: "Rak -> Sharja",
      date: "25-02-2021",
      size: "3.5KM",
      totalTicket: "30 Ticket",
    ),
    RecentFile(
      icon: "assets/bus_icon.png",
      title: "Rak -> Dubai",
      date: "25-02-2021",
      size: "3.5KM",
      totalTicket: "30 Ticket",
    ),
    RecentFile(
      icon: "assets/bus_icon.png",
      title: "Rak -> Sharja",
      date: "25-02-2021",
      size: "3.5KM",
      totalTicket: "30 Ticket",
    ),
  ];

  DataRow workingDriverDataRow(({String driverName, String a, String b, String status}) record) {
    return DataRow(
      cells: [
        DataCell(
          Text(record.driverName),
        ),
        DataCell(Text(record.a)),
        DataCell(Text(record.b)),
        DataCell(Text(
          record.status,
          style: TextStyle(color: record.status == "Stopped" ? Colors.red : Colors.green),
        )),
        DataCell(ElevatedButton(
          style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.blue),
          ),
          onPressed: () {
            Get.to(() => BusDriverScreen(record: record));
          },
          child: Text("Details"),
        )),
      ],
    );
  }

  List<({String driverName, String a, String b, String status})> listWorkingDriver = [
    (driverName: "Driver Name", a: "12", b: "3.5KM", status: "Stopped"),
    (driverName: "Driver Name", a: "12", b: "3.5KM", status: "Working"),
    (driverName: "Driver Name", a: "12", b: "3.5KM", status: "Working"),
    (driverName: "Driver Name", a: "12", b: "3.5KM", status: "Stopped"),
    (driverName: "Driver Name", a: "12", b: "3.5KM", status: "Working"),
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
      color: Colors.pink.withOpacity(0.5),
      value: 188,
      showTitle: false,
      radius: 20,
    ),
  ];

  List<PieChartSectionData> BusTicketChartSelectionData = [
    PieChartSectionData(
      color: Colors.green,
      value: 85,
      showTitle: false,
      radius: 20,
    ),
    PieChartSectionData(
      color: Colors.red,
      value: 15,
      showTitle: false,
      radius: 20,
    ),
  ];
}
