import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:isrospaceapp/Models/satelliteModel.dart';
import 'package:isrospaceapp/Pages/Utilities/GridLayoutPage.dart';

class SatellitesDetailedPage extends StatefulWidget {
  SatelliteModel satelliteModel;
  SatellitesDetailedPage({super.key, required this.satelliteModel});

  @override
  State<SatellitesDetailedPage> createState() => _SatellitesDetailedPageState();
}

class _SatellitesDetailedPageState extends State<SatellitesDetailedPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Space Crafts', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
        iconTheme: IconThemeData(
          color: Colors.red, // Set your desired color here
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 4, 36, 63),
                Color.fromARGB(255, 60, 4, 71),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 2, 34, 61),
              Color.fromARGB(255, 93, 5, 110),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.satelliteModel.name,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: size.height / 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      spreadRadius: 0.5,
                      offset: Offset(1.0, 1.0),
                    )
                  ],
                ),
                // child: Center(
                //   child: CachedNetworkImage(
                //     width: size.width / 1.125,
                //     height: size.height / 3,
                //     imageUrl: widget.launch.image!,
                //     placeholder: (context, url) => CircularProgressIndicator(),
                //     errorWidget: (context, url, error) => Icon(Icons.error),
                //   ),
                // ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    GridLayoutPage(title: 'Name', value: widget.satelliteModel.name!),
                    GridLayoutPage(
                        title: 'Owner', value: widget.satelliteModel.owner),
                    GridLayoutPage(
                        title: 'Date',
                        value: widget.satelliteModel.date.toString()),
                    GridLayoutPage(
                        title: 'Country', value: widget.satelliteModel.country),
                    GridLayoutPage(
                        title: 'Purpose',
                        value: widget.satelliteModel.purpose),
                    GridLayoutPage(title: 'Users', value:widget.satelliteModel.users),
                    GridLayoutPage(title: 'Orbit', value: widget.satelliteModel.orbit),
                    GridLayoutPage(
                        title: 'source',
                        value: widget.satelliteModel.source),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}