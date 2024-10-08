import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:isrospaceapp/Models/Launch.dart';
import 'package:isrospaceapp/Pages/Utilities/GridLayoutPage.dart';

class DetailedPage extends StatefulWidget {
  final Launch launch;
  DetailedPage({super.key, required this.launch});

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
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
                  widget.launch.name!,
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
                child: Center(
                  child: CachedNetworkImage(
                    width: size.width / 1.125,
                    height: size.height / 3,
                    imageUrl: widget.launch.image!,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    GridLayoutPage(title: 'Name', value: widget.launch.name!),
                    GridLayoutPage(
                        title: 'Mission', value: widget.launch.mission!.name!),
                    GridLayoutPage(
                        title: 'Launch Date',
                        value: widget.launch.windowStart!.toString()),
                    GridLayoutPage(
                        title: 'Status', value: widget.launch.status!.name!),
                    GridLayoutPage(
                        title: 'Rocket',
                        value: widget.launch.rocket!.configuration!.name!),
                    GridLayoutPage(title: 'Type', value: widget.launch.type!),
                    GridLayoutPage(title: 'Orbit', value: widget.launch.orbit ?? "UnAvailable"),
                    GridLayoutPage(
                        title: 'Launch Pad',
                        value: widget.launch.pad!.name!),

                    GridLayoutPage(title: 'Id', value: widget.launch.id!),
                    GridLayoutPage(
                        title: 'Last Updated', value: widget.launch.lastUpdated!.toString()),

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
