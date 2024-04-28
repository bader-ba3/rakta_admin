import 'package:flutter/material.dart';

class Chart3 extends StatefulWidget {
  const Chart3({super.key});

  @override
  State<Chart3> createState() => _Chart3State();
}

class _Chart3State extends State<Chart3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SizedBox(
        width: double.infinity,
        child: DataTable(
          columnSpacing: 16.0,
          columns: [
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
              label: Text("Operating costs"),
            ),
            DataColumn(
              label: Text("Percentage last month"),
            ),
            DataColumn(
              label: Text("Efficiency ratio"),
            ),
          ],
          rows: List.generate(
            listWorkingDriver.length, (index) => workingDriverDataRow(listWorkingDriver[index]),
          ),
        ),
      ),
    );
  }

  DataRow workingDriverDataRow(({String driverName, String NumberOfTrip, String TotalIncome, String OperatingCosts, String percentageLastMonth,String percentageLastMonthType, String EfficiencyRatio}) record) {
    return DataRow(
      cells: [
        DataCell(Text(record.driverName),),
        DataCell(Text(record.NumberOfTrip)),
        DataCell(Text(record.TotalIncome+" AED")),
        DataCell(Text(record.OperatingCosts+" AED")),
        DataCell(Text(record.percentageLastMonth)),
        DataCell(Text(record.EfficiencyRatio, style: TextStyle(color: record.percentageLastMonthType == "down" ? Colors.red : Colors.green),)),
      ],
    );
  }

  List<({String driverName, String NumberOfTrip, String TotalIncome, String OperatingCosts, String percentageLastMonth,String percentageLastMonthType, String EfficiencyRatio})> listWorkingDriver = [
  (driverName: "driverName" ,NumberOfTrip:"25",TotalIncome:"500",OperatingCosts:"100",percentageLastMonth:"80%",percentageLastMonthType:"up",EfficiencyRatio:"90%"),
  (driverName: "driverName" ,NumberOfTrip:"40",TotalIncome:"800",OperatingCosts:"300",percentageLastMonth:"55%",percentageLastMonthType:"up",EfficiencyRatio:"60%"),
  (driverName: "driverName" ,NumberOfTrip:"64",TotalIncome:"752",OperatingCosts:"400",percentageLastMonth:"78%",percentageLastMonthType:"down",EfficiencyRatio:"50%"),
  (driverName: "driverName" ,NumberOfTrip:"45",TotalIncome:"900",OperatingCosts:"250",percentageLastMonth:"67%",percentageLastMonthType:"up",EfficiencyRatio:"%70"),
  (driverName: "driverName" ,NumberOfTrip:"82",TotalIncome:"452",OperatingCosts:"120",percentageLastMonth:"55%",percentageLastMonthType:"down",EfficiencyRatio:"50%"),
  (driverName: "driverName" ,NumberOfTrip:"78",TotalIncome:"925",OperatingCosts:"500",percentageLastMonth:"70%",percentageLastMonthType:"up",EfficiencyRatio:"90%"),
  (driverName: "driverName" ,NumberOfTrip:"75",TotalIncome:"1452",OperatingCosts:"100",percentageLastMonth:"75%",percentageLastMonthType:"down",EfficiencyRatio:"60%"),
  (driverName: "driverName" ,NumberOfTrip:"52",TotalIncome:"500",OperatingCosts:"300",percentageLastMonth:"50%",percentageLastMonthType:"up",EfficiencyRatio:"80%"),
  ];

}
