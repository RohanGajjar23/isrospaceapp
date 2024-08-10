import 'dart:typed_data';

class Spacecraft {

  String? id;
  int? serialId;
  String? name;
  String? launchDate;
  String? launchVehicle;
  String? orbitType;
  String? application;
  String? link;
  String? missionStatus;
  Uint8List imageUrl = Uint8List(0);

   Spacecraft({
    this.id,
    this.serialId,
    this.name,
    this.launchDate,
    this.launchVehicle,
    this.orbitType,
    this.application,
    this.link,
    this.missionStatus,
  });

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'serialNumber': serialId,
      'name': name,
      'launchDate': launchDate,
      'launchVehicle': launchVehicle,
      'orbitType': orbitType,
      'application': application,
      'link': link,
      'missionStatus': missionStatus,
    };
  }

  factory Spacecraft.fromMap(Map<String, dynamic> map) {
    return Spacecraft(
      id: map['_id'],
      serialId: map['serialNumber'],
      name: map['name'],
      launchDate: map['launchDate'],
      launchVehicle: map['launchVehicle'],
      orbitType: map['orbitType'],
      application: map['application'],
      link: map['link'],
      missionStatus: map['missionStatus'],
    );
  }

    factory Spacecraft.fromJson(Map<String, dynamic> json) => Spacecraft(
        id: json['_id'],
        serialId: int.parse(json['serialNumber']),
        name: json['name'],
        launchDate: json['launchDate'],
        launchVehicle: json['launchVehicle'],
        orbitType: json['orbitType'],
        application: json['application'],
        link: json['link'],
        missionStatus: json['missionStatus'],
      );
}