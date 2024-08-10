import 'dart:convert';

class SatelliteMission {
  final dynamic satelliteName;
  final dynamic missionName;
  final dynamic launchDate;
  final dynamic launchVehicle;
  final dynamic launchVehicleMissionNumber;
  final dynamic purpose;
  final dynamic satelliteWeight;
  final dynamic satellitePower;
  final dynamic satelliteMissionLife;
  final dynamic payloadThermalImagingCameraLandSurfaceTemperatureAssessment;
  final dynamic payloadThermalImagingCameraWaterSurfaceTemperatureAssessment;
  final dynamic payloadThermalImagingCameraVegetationDemarcation;
  final dynamic payloadThermalImagingCameraThermalInertia;
  final dynamic relatedWebsite1;
  final dynamic relatedWebsite2;
  final dynamic relatedWebsite3;

  SatelliteMission({
    required this.satelliteName,
    required this.missionName,
    required this.launchDate,
    required this.launchVehicle,
    required this.launchVehicleMissionNumber,
    required this.purpose,
    required this.satelliteWeight,
    required this.satellitePower,
    required this.satelliteMissionLife,
    required this.payloadThermalImagingCameraLandSurfaceTemperatureAssessment,
    required this.payloadThermalImagingCameraWaterSurfaceTemperatureAssessment,
    required this.payloadThermalImagingCameraVegetationDemarcation,
    required this.payloadThermalImagingCameraThermalInertia,
    required this.relatedWebsite1,
    required this.relatedWebsite2,
    required this.relatedWebsite3,
  });

  factory SatelliteMission.fromJson(Map<String, dynamic> json) {
    return SatelliteMission(
      satelliteName: json['satellite_name'],
      missionName: json['mission_name'],
      launchDate: json['launch_date'],
      launchVehicle: json['launch_vehicle'],
      launchVehicleMissionNumber: json['launch_vehicle_mission_number'],
      purpose: json['purpose'],
      satelliteWeight: json['satellite_weight'],
      satellitePower: json['satellite_power'] ?? 'null', // Handle possible null value
      satelliteMissionLife: json['satellite_mission_life'] ?? 'null', // Handle possible null value
      payloadThermalImagingCameraLandSurfaceTemperatureAssessment: json['payload_thermal_imaging_camera_land_surface_temperature_assessment'],
      payloadThermalImagingCameraWaterSurfaceTemperatureAssessment: json['payload_thermal_imaging_camera_water_surface_temperature_assessment'],
      payloadThermalImagingCameraVegetationDemarcation: json['payload_thermal_imaging_camera_vegetation_demarcation'],
      payloadThermalImagingCameraThermalInertia: json['payload_thermal_imaging_camera_thermal_inertia'],
      relatedWebsite1: json['related_website_1'],
      relatedWebsite2: json['related_website_2'],
      relatedWebsite3: json['related_website_3'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'satellite_name': satelliteName,
      'mission_name': missionName,
      'launch_date': launchDate,
      'launch_vehicle': launchVehicle,
      'launch_vehicle_mission_number': launchVehicleMissionNumber,
      'purpose': purpose,
      'satellite_weight': satelliteWeight,
      'satellite_power': satellitePower,
      'satellite_mission_life': satelliteMissionLife,
      'payload_thermal_imaging_camera_land_surface_temperature_assessment': payloadThermalImagingCameraLandSurfaceTemperatureAssessment,
      'payload_thermal_imaging_camera_water_surface_temperature_assessment': payloadThermalImagingCameraWaterSurfaceTemperatureAssessment,
      'payload_thermal_imaging_camera_vegetation_demarcation': payloadThermalImagingCameraVegetationDemarcation,
      'payload_thermal_imaging_camera_thermal_inertia': payloadThermalImagingCameraThermalInertia,
      'related_website_1': relatedWebsite1,
      'related_website_2': relatedWebsite2,
      'related_website_3': relatedWebsite3,
    };
  }
}

