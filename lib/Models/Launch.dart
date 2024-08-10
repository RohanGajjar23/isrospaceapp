import 'package:hive/hive.dart';

part 'Launch.g.dart';
@HiveType(typeId: 0)
class Launch extends HiveObject {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? url;
  @HiveField(2)
  final String? slug;
  @HiveField(3)
  final String? name;
  @HiveField(4)
  final Status? status;
  @HiveField(5)
  final DateTime? lastUpdated;
  @HiveField(6)
  final DateTime? net;
  @HiveField(7)
  final NetPrecision? netPrecision;
  @HiveField(8)
  final DateTime? windowEnd;
  @HiveField(9)
  final DateTime? windowStart;
  @HiveField(10)
  final String? lspName;
  @HiveField(11)
  final Mission? mission;
  @HiveField(12)
  final String? missionType;
  @HiveField(13)
  final Pad? pad;
  @HiveField(14)
  final String? location;
  @HiveField(15)
  final String? landing;
  @HiveField(16)
  final int? landingSuccess;
  @HiveField(17)
  final String? launcher;
  @HiveField(18)
  final String? orbit;
  @HiveField(19)
  final String? image;
  @HiveField(20)
  final String? infographic;
  @HiveField(21)
  final String? type;
  @HiveField(22)
  final List<Update>? updates;
  @HiveField(23)
  final LaunchServiceProvider? launchServiceProvider;
  @HiveField(24)
  final Rocket? rocket;

  Launch({
    this.id,
    this.url,
    this.slug,
    this.name,
    this.status,
    this.lastUpdated,
    this.net,
    this.netPrecision,
    this.windowEnd,
    this.windowStart,
    this.lspName,
    this.mission,
    this.missionType,
    this.pad,
    this.location,
    this.landing,
    this.landingSuccess,
    this.launcher,
    this.orbit,
    this.image,
    this.infographic,
    this.type,
    this.updates,
    this.launchServiceProvider,
    this.rocket,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      id: json['id'] as String?,
      url: json['url'] as String?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      status: json['status'] != null
          ? Status.fromJson(json['status'] as Map<String, dynamic>)
          : null,
      lastUpdated: json['last_updated'] != null
          ? DateTime.parse(json['last_updated'] as String)
          : null,
      net: json['net'] != null ? DateTime.parse(json['net'] as String) : null,
      netPrecision: json['net_precision'] != null
          ? NetPrecision.fromJson(json['net_precision'] as Map<String, dynamic>)
          : null,
      windowEnd: json['window_end'] != null
          ? DateTime.parse(json['window_end'] as String)
          : null,
      windowStart: json['window_start'] != null
          ? DateTime.parse(json['window_start'] as String)
          : null,
      lspName: json['lsp_name'] as String?,
      mission: json['mission'] != null
          ? Mission.fromJson(json['mission'] as Map<String, dynamic>)
          : null,
      missionType: json['mission_type'] as String?,
      pad: json['pad'] != null
          ? Pad.fromJson(json['pad'] as Map<String, dynamic>)
          : null,
      location: json['location'] as String?,
      landing: json['landing'] as String?,
      landingSuccess: json['landing_success'] as int?,
      launcher: json['launcher'] as String?,
      orbit: json['orbit'] as String?,
      image: json['image'] as String?,
      infographic: json['infographic'] as String?,
      type: json['type'] as String?,
      updates: json['updates'] != null
          ? (json['updates'] as List<dynamic>)
              .map((e) => Update.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      launchServiceProvider: json['launch_service_provider'] != null
          ? LaunchServiceProvider.fromJson(
              json['launch_service_provider'] as Map<String, dynamic>)
          : null,
      rocket: json['rocket'] != null
          ? Rocket.fromJson(json['rocket'] as Map<String, dynamic>)
          : null,
    );
  }
}

@HiveType(typeId: 1)
class Status {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? abbrev;
  @HiveField(3)
  final String? description;

  Status({this.id, this.name, this.abbrev, this.description});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json['id'] as int?,
      name: json['name'] as String?,
      abbrev: json['abbrev'] as String?,
      description: json['description'] as String?,
    );
  }
}


@HiveType(typeId: 2)
class NetPrecision {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? abbrev;
  @HiveField(3)
  final String? description;

  NetPrecision({this.id, this.name, this.abbrev, this.description});

  factory NetPrecision.fromJson(Map<String, dynamic> json) {
    return NetPrecision(
      id: json['id'] as int?,
      name: json['name'] as String?,
      abbrev: json['abbrev'] as String?,
      description: json['description'] as String?,
    );
  }
}

@HiveType(typeId: 3)
class Update {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? profileImage;
  @HiveField(2)
  final String? comment;
  @HiveField(3)
  final String? infoUrl;
  @HiveField(4)
  final String? createdBy;
  @HiveField(5)
  final DateTime? createdOn;

  Update(
      {this.id,
      this.profileImage,
      this.comment,
      this.infoUrl,
      this.createdBy,
      this.createdOn});

  factory Update.fromJson(Map<String, dynamic> json) {
    return Update(
      id: json['id'] as int?,
      profileImage: json['profile_image'] as String?,
      comment: json['comment'] as String?,
      infoUrl: json['info_url'] as String?,
      createdBy: json['created_by'] as String?,
      createdOn: json['created_on'] != null
          ? DateTime.parse(json['created_on'] as String)
          : null,
    );
  }
}

@HiveType(typeId: 4)
class LaunchServiceProvider {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? url;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final bool? featured;
  @HiveField(4)
  final String? type;
  @HiveField(5)
  final String? countryCode;
  @HiveField(6)
  final String? abbrev;
  @HiveField(7)
  final String? description;
  @HiveField(8)
  final String? administrator;
  @HiveField(9)
  final String? foundingYear;
  @HiveField(10)
  final String? launchers;
  @HiveField(11)
  final String? spacecraft;
  @HiveField(12)
  final String? launchLibraryUrl;
  @HiveField(13)
  final int? totalLaunchCount;
  @HiveField(14)
  final int? consecutiveSuccessfulLaunches;
  @HiveField(15)
  final int? successfulLaunches;
  @HiveField(16)
  final int? failedLaunches;
  @HiveField(17)
  final int? pendingLaunches;
  @HiveField(18)
  final int? consecutiveSuccessfulLandings;
  @HiveField(19)
  final int? successfulLandings;
  @HiveField(20)
  final int? failedLandings;
  @HiveField(21)
  final int? attemptedLandings;
  @HiveField(22)
  final String? infoUrl;
  @HiveField(23)
  final String? wikiUrl;
  @HiveField(24)
  final String? logoUrl;
  @HiveField(25)
  final String? imageUrl;
  @HiveField(26)
  final String? nationUrl;

  LaunchServiceProvider(
      {this.id,
      this.url,
      this.name,
      this.featured,
      this.type,
      this.countryCode,
      this.abbrev,
      this.description,
      this.administrator,
      this.foundingYear,
      this.launchers,
      this.spacecraft,
      this.launchLibraryUrl,
      this.totalLaunchCount,
      this.consecutiveSuccessfulLaunches,
      this.successfulLaunches,
      this.failedLaunches,
      this.pendingLaunches,
      this.consecutiveSuccessfulLandings,
      this.successfulLandings,
      this.failedLandings,
      this.attemptedLandings,
      this.infoUrl,
      this.wikiUrl,
      this.logoUrl,
      this.imageUrl,
      this.nationUrl});

  factory LaunchServiceProvider.fromJson(Map<String, dynamic> json) {
    return LaunchServiceProvider(
      id: json['id'] as int?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      featured: json['featured'] as bool?,
      type: json['type'] as String?,
      countryCode: json['country_code'] as String?,
      abbrev: json['abbrev'] as String?,
      description: json['description'] as String?,
      administrator: json['administrator'] as String?,
      foundingYear: json['founding_year'] as String?,
      launchers: json['launchers'] as String?,
      spacecraft: json['spacecraft'] as String?,
      launchLibraryUrl: json['launch_library_url'] as String?,
      totalLaunchCount: json['total_launch_count'] as int?,
      consecutiveSuccessfulLaunches:
          json['consecutive_successful_launches'] as int?,
      successfulLaunches: json['successful_launches'] as int?,
      failedLaunches: json['failed_launches'] as int?,
      pendingLaunches: json['pending_launches'] as int?,
      consecutiveSuccessfulLandings:
          json['consecutive_successful_landings'] as int?,
      successfulLandings: json['successful_landings'] as int?,
      failedLandings: json['failed_landings'] as int?,
      attemptedLandings: json['attempted_landings'] as int?,
      infoUrl: json['info_url'] as String?,
      wikiUrl: json['wiki_url'] as String?,
      logoUrl: json['logo_url'] as String?,
      imageUrl: json['image_url'] as String?,
      nationUrl: json['nation_url'] as String?,
    );
  }
}

@HiveType(typeId: 5)
class RocketConfiguration {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? url;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final bool? active;
  @HiveField(4)
  final bool? reusable;
  @HiveField(5)
  final String? description;
  @HiveField(6)
  final String? family;
  @HiveField(7)
  final String? fullName;
  @HiveField(8)
  final LaunchServiceProvider? manufacturer;

  RocketConfiguration(
      {this.id,
      this.url,
      this.name,
      this.active,
      this.reusable,
      this.description,
      this.family,
      this.fullName,
      this.manufacturer});

  factory RocketConfiguration.fromJson(Map<String, dynamic> json) {
    return RocketConfiguration(
      id: json['id'] as int?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      active: json['active'] as bool?,
      reusable: json['reusable'] as bool?,
      description: json['description'] as String?,
      family: json['family'] as String?,
      fullName: json['full_name'] as String?,
      manufacturer: json['manufacturer'] != null
          ? LaunchServiceProvider.fromJson(
              json['manufacturer'] as Map<String, dynamic>)
          : null,
    );
  }
}

@HiveType(typeId: 6)
class Rocket {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final RocketConfiguration? configuration;

  Rocket({this.id, this.configuration});

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      id: json['id'] as int?,
      configuration: json['configuration'] != null
          ? RocketConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
    );
  }
}

@HiveType(typeId: 7)
class Mission {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? launchDesignator;
  @HiveField(4)
  final String? type;
  @HiveField(5)
  final Orbit? orbit;
  @HiveField(6)
  final List<Agency>? agencies;
  @HiveField(7)
  final List<InfoUrl>? infoUrls;
  @HiveField(8)
  final List<VideoUrl>? vidUrls;

  Mission({
    this.id,
    this.name,
    this.description,
    this.launchDesignator,
    this.type,
    this.orbit,
    this.agencies,
    this.infoUrls,
    this.vidUrls,
  });

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      launchDesignator: json['launch_designator'] as String?,
      type: json['type'] as String?,
      orbit: json['orbit'] != null
          ? Orbit.fromJson(json['orbit'] as Map<String, dynamic>)
          : null,
      agencies: json['agencies'] != null
          ? (json['agencies'] as List<dynamic>)
              .map((e) => Agency.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      infoUrls: json['info_urls'] != null
          ? (json['info_urls'] as List<dynamic>)
              .map((e) => InfoUrl.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      vidUrls: json['vid_urls'] != null
          ? (json['vid_urls'] as List<dynamic>)
              .map((e) => VideoUrl.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }
}

@HiveType(typeId: 8)
class Orbit {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? abbrev;

  Orbit({this.id, this.name, this.abbrev});

  factory Orbit.fromJson(Map<String, dynamic> json) {
    return Orbit(
      id: json['id'] as int?,
      name: json['name'] as String?,
      abbrev: json['abbrev'] as String?,
    );
  }
}

@HiveType(typeId: 9)
class Agency {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? url;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final bool? featured;
  @HiveField(4)
  final String? type;
  @HiveField(5)
  final String? countryCode;
  @HiveField(6)
  final String? abbrev;
  @HiveField(7)
  final String? description;
  @HiveField(8)
  final String? administrator;
  @HiveField(9)
  final String? foundingYear;
  @HiveField(10)
  final String? launchers;
  @HiveField(11)
  final String? spacecraft;
  @HiveField(12)
  final String? launchLibraryUrl;
  @HiveField(13)
  final int? totalLaunchCount;
  @HiveField(14)
  final int? consecutiveSuccessfulLaunches;
  @HiveField(15)
  final int? successfulLaunches;
  @HiveField(16)
  final int? failedLaunches;
  @HiveField(17)
  final int? pendingLaunches;
  @HiveField(18)
  final int? consecutiveSuccessfulLandings;
  @HiveField(19)
  final int? successfulLandings;
  @HiveField(20)
  final int? failedLandings;
  @HiveField(21)
  final int? attemptedLandings;
  @HiveField(22)
  final String? infoUrl;
  @HiveField(23)
  final String? wikiUrl;
  @HiveField(24)
  final String? logoUrl;
  @HiveField(25)
  final String? imageUrl;
  @HiveField(26)
  final String? nationUrl;

  Agency(
      {this.id,
      this.url,
      this.name,
      this.featured,
      this.type,
      this.countryCode,
      this.abbrev,
      this.description,
      this.administrator,
      this.foundingYear,
      this.launchers,
      this.spacecraft,
      this.launchLibraryUrl,
      this.totalLaunchCount,
      this.consecutiveSuccessfulLaunches,
      this.successfulLaunches,
      this.failedLaunches,
      this.pendingLaunches,
      this.consecutiveSuccessfulLandings,
      this.successfulLandings,
      this.failedLandings,
      this.attemptedLandings,
      this.infoUrl,
      this.wikiUrl,
      this.logoUrl,
      this.imageUrl,
      this.nationUrl});

  factory Agency.fromJson(Map<String, dynamic> json) {
    return Agency(
      id: json['id'] as int?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      featured: json['featured'] as bool?,
      type: json['type'] as String?,
      countryCode: json['country_code'] as String?,
      abbrev: json['abbrev'] as String?,
      description: json['description'] as String?,
      administrator: json['administrator'] as String?,
      foundingYear: json['founding_year'] as String?,
      launchers: json['launchers'] as String?,
      spacecraft: json['spacecraft'] as String?,
      launchLibraryUrl: json['launch_library_url'] as String?,
      totalLaunchCount: json['total_launch_count'] as int?,
      consecutiveSuccessfulLaunches:
          json['consecutive_successful_launches'] as int?,
      successfulLaunches: json['successful_launches'] as int?,
      failedLaunches: json['failed_launches'] as int?,
      pendingLaunches: json['pending_launches'] as int?,
      consecutiveSuccessfulLandings:
          json['consecutive_successful_landings'] as int?,
      successfulLandings: json['successful_landings'] as int?,
      failedLandings: json['failed_landings'] as int?,
      attemptedLandings: json['attempted_landings'] as int?,
      infoUrl: json['info_url'] as String?,
      wikiUrl: json['wiki_url'] as String?,
      logoUrl: json['logo_url'] as String?,
      imageUrl: json['image_url'] as String?,
      nationUrl: json['nation_url'] as String?,
    );
  }
}

@HiveType(typeId: 10)
class InfoUrl {
  @HiveField(0)
  final int? priority;
  @HiveField(1)
  final String? source;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? featureImage;
  @HiveField(5)
  final String? url;
  @HiveField(6)
  final InfoUrlType? type;
  @HiveField(7)
  final Language? language;

  InfoUrl(
      {this.priority,
      this.source,
      this.title,
      this.description,
      this.featureImage,
      this.url,
      this.type,
      this.language});

  factory InfoUrl.fromJson(Map<String, dynamic> json) {
    return InfoUrl(
      priority: json['priority'] as int?,
      source: json['source'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      featureImage: json['feature_image'] as String?,
      url: json['url'] as String?,
      type: json['type'] != null
          ? InfoUrlType.fromJson(json['type'] as Map<String, dynamic>)
          : null,
      language: json['language'] != null
          ? Language.fromJson(json['language'] as Map<String, dynamic>)
          : null,
    );
  }
}

@HiveType(typeId: 11)
class InfoUrlType {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;

  InfoUrlType({this.id, this.name});

  factory InfoUrlType.fromJson(Map<String, dynamic> json) {
    return InfoUrlType(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );
  }
}

@HiveType(typeId: 12)
class Language {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? code;

  Language({this.id, this.name, this.code});

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
    );
  }
}

@HiveType(typeId: 13)
class VideoUrl {
  @HiveField(0)
  final int? priority;
  @HiveField(1)
  final String? source;
  @HiveField(2)
  final String? publisher;
  @HiveField(3)
  final String? title;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final String? featureImage;
  @HiveField(6)
  final String? url;
  @HiveField(7)
  final InfoUrlType? type;
  @HiveField(8)
  final Language? language;
  @HiveField(9)
  final DateTime? startTime;
  @HiveField(10)
  final DateTime? endTime;

  VideoUrl({
    this.priority,
    this.source,
    this.publisher,
    this.title,
    this.description,
    this.featureImage,
    this.url,
    this.type,
    this.language,
    this.startTime,
    this.endTime,
  });

  factory VideoUrl.fromJson(Map<String, dynamic> json) {
    return VideoUrl(
      priority: json['priority'] as int?,
      source: json['source'] as String?,
      publisher: json['publisher'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      featureImage: json['feature_image'] as String?,
      url: json['url'] as String?,
      type: json['type'] != null
          ? InfoUrlType.fromJson(json['type'] as Map<String, dynamic>)
          : null,
      language: json['language'] != null
          ? Language.fromJson(json['language'] as Map<String, dynamic>)
          : null,
      startTime: json['start_time'] != null
          ? DateTime.parse(json['start_time'] as String)
          : null,
      endTime: json['end_time'] != null
          ? DateTime.parse(json['end_time'] as String)
          : null,
    );
  }
}

@HiveType(typeId: 14)
class PadLocation {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? url;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? countryCode;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final String? mapImage;
  @HiveField(6)
  final String? timezoneName;
  @HiveField(7)
  final int? totalLaunchCount;
  @HiveField(8)
  final int? totalLandingCount;

  PadLocation({
    this.id,
    this.url,
    this.name,
    this.countryCode,
    this.description,
    this.mapImage,
    this.timezoneName,
    this.totalLaunchCount,
    this.totalLandingCount,
  });

  factory PadLocation.fromJson(Map<String, dynamic> json) {
    return PadLocation(
      id: json['id'] as int?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      countryCode: json['country_code'] as String?,
      description: json['description'] as String?,
      mapImage: json['map_image'] as String?,
      timezoneName: json['timezone_name'] as String?,
      totalLaunchCount: json['total_launch_count'] as int?,
      totalLandingCount: json['total_landing_count'] as int?,
    );
  }
}

@HiveType(typeId: 15)
class Pad {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? url;
  @HiveField(2)
  final int? agencyId;
  @HiveField(3)
  final String? name;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final String? infoUrl;
  @HiveField(6)
  final String? wikiUrl;
  @HiveField(7)
  final String? mapUrl;
  @HiveField(8)
  final String? latitude;
  @HiveField(9)
  final String? longitude;
  @HiveField(10)
  final PadLocation? location;
  @HiveField(11)
  final String? countryCode;
  @HiveField(12)
  final String? mapImage;
  @HiveField(13)
  final int? totalLaunchCount;
  @HiveField(14)
  final int? orbitalLaunchAttemptCount;

  Pad({
    this.id,
    this.url,
    this.agencyId,
    this.name,
    this.description,
    this.infoUrl,
    this.wikiUrl,
    this.mapUrl,
    this.latitude,
    this.longitude,
    this.location,
    this.countryCode,
    this.mapImage,
    this.totalLaunchCount,
    this.orbitalLaunchAttemptCount,
  });

  factory Pad.fromJson(Map<String, dynamic> json) {
    return Pad(
      id: json['id'] as int?,
      url: json['url'] as String?,
      agencyId: json['agency_id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      infoUrl: json['info_url'] as String?,
      wikiUrl: json['wiki_url'] as String?,
      mapUrl: json['map_url'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      location: json['location'] != null
          ? PadLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      countryCode: json['country_code'] as String?,
      mapImage: json['map_image'] as String?,
      totalLaunchCount: json['total_launch_count'] as int?,
      orbitalLaunchAttemptCount:
          json['orbital_launch_attempt_count'] as int?,
    );
  }
}

// Caching and Retrieval Functions

Future<void> cacheEvents(List<Launch> events) async {
  final box = await Hive.openBox<Launch>('cachedEvents'); // Replace 'cachedEvents' with your desired box name
  await box.clear(); // Clear existing data (optional)
  await box.addAll(events); // Add all events to the cache
}

Future<List<Launch>> getCachedEvents() async {
  final box = await Hive.openBox<Launch>('cachedEvents'); // Same box name
  return box.values.toList();
}

