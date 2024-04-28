import 'dart:async';
import 'dart:math';

import 'package:rakta_admin/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'home_View_Model.dart';

class MapsScreen extends StatefulWidget {
  MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  int? markerNow;
  List text = ["Crowd","Road problem","car accident","Closed road","Crowd of people"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeViewModel>(
        builder: (homeViewModel) {
          return Stack(
            children: [
              SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      child: GoogleMap(
                        myLocationButtonEnabled: false,
                        compassEnabled: true,
                        zoomControlsEnabled: false,
                        myLocationEnabled: true,
                        initialCameraPosition: CameraPosition(target: LatLng(25.781507,55.942091),zoom: 15),
                        mapType: MapType.normal,
                        polygons: {
                          Polygon(polygonId: PolygonId("1"),
                              points: homeViewModel.ridesPloy,fillColor: Colors.green.withOpacity(0.2),strokeWidth: 2)
                        },
                        onMapCreated: (controller) async {
                          String mapStyle =
                          await rootBundle.loadString('assets/map_style.json');
                          controller.setMapStyle(mapStyle);
                          homeViewModel.controller = Completer();
                          homeViewModel.controller.complete(controller);
                          homeViewModel.setMarker(const LatLng(25.784937939271234, 55.96950907868376), "bus_top", "bus1","10",size: 15);
                          homeViewModel.setMarker(const LatLng(25.77788539214604, 55.93905446659033), "ferry", "ferry1","40",size: 15);
                          homeViewModel.setMarker(const LatLng(25.789401, 55.952052), "ferry", "ferry2","-100",size: 15);
                          homeViewModel.setMarker(const LatLng(25.786473, 55.947056), "images/scoter", "scoter","0",size: 25);
                          homeViewModel.setMarker(const LatLng(25.789815, 55.950899), "images/scoter", "scoter2","0",size: 25);
                          homeViewModel.setMarker(const  LatLng(25.786453, 55.947556), "images/bike", "bike","0",size: 25,);
                          homeViewModel.setMarker(const   LatLng(25.783603, 55.944155), "images/bike", "bike2","0",size: 25,);
                          homeViewModel.getDrawPolylineGreen([]);
                          homeViewModel.getDrawPolylineRedLine([]);
                          homeViewModel.getDrawPolylineBlue([]);
                          homeViewModel.getDrawPolylinePurple([]);
                        },
                        onTap: (_){
                          if(markerNow!=null){
                            homeViewModel.setMarker( _, "map${markerNow!+1}", Random().nextInt(100200).toString(),"0",size: 25,);
                            setState(() {

                            });
                          }

                        },
                        markers: homeViewModel.markers.values.toSet(),
                        polylines: homeViewModel.polyLines,
                      ),),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 140,
                      width: 500,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ...List.generate(4, (index) => Expanded(
                            child: InkWell(
                              onTap: (){
                                markerNow = index;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(color: markerNow == index ?Colors.blue:Colors.transparent,borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 5,),
                                        Image.asset("assets/map${index+1}.png",width: 60,),
                                        SizedBox(height: 5,),
                                        Expanded(child: Center(child: Text(text[index],style: TextStyle(color: Colors.black),maxLines: null,textAlign: TextAlign.center,)))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                        ]
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 140,
                      width: 120,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            markerNow = 4;
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(color: markerNow == 4 ?Colors.blue:Colors.transparent,borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SizedBox(height: 5,),
                                  Image.asset("assets/map5.png",width: 60,),
                                  SizedBox(height: 5,),
                                  Expanded(child: Center(child: Text(text[4],style: TextStyle(color: Colors.black),maxLines: null,textAlign: TextAlign.center,)))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
