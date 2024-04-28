import 'package:rakta_admin/screens/reports/widget/bar_char.dart';
import 'package:rakta_admin/screens/reports/widget/pie_chart.dart';
import 'package:rakta_admin/screens/reports/widget/radar_chart.dart';
import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Report",style: TextStyle(fontSize: 30),),
            Center(child: Text("Taxi vs Buses vs Ferry",style: TextStyle(fontSize: 30),)),
            Center(
              child: SizedBox(
                  width: MediaQuery.sizeOf(context).width/1.6,
                  child: RadarChartScreen()),
            ),
            Center(child: Text("Customer Per Week day",style: TextStyle(fontSize: 30),)),
            Center(
              child: SizedBox(
                height: 500,
                  width: MediaQuery.sizeOf(context).width/1.6,
                  child: BaeChartLine()),
            ),
            SizedBox(height: 100,),
            Center(child: Text("Income Chart",style: TextStyle(fontSize: 30),)),
            Center(
              child: SizedBox(
                  height: 500,
                  width: MediaQuery.sizeOf(context).width/1.6,
                  child: PieChartLine()),
            ),
          ],
        ),
      ),
    );
  }
}
