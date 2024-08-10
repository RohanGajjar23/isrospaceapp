// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Launch.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LaunchAdapter extends TypeAdapter<Launch> {
  @override
  final int typeId = 0;

  @override
  Launch read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Launch(
      id: fields[0] as String?,
      url: fields[1] as String?,
      slug: fields[2] as String?,
      name: fields[3] as String?,
      status: fields[4] as Status?,
      lastUpdated: fields[5] as DateTime?,
      net: fields[6] as DateTime?,
      netPrecision: fields[7] as NetPrecision?,
      windowEnd: fields[8] as DateTime?,
      windowStart: fields[9] as DateTime?,
      lspName: fields[10] as String?,
      mission: fields[11] as Mission?,
      missionType: fields[12] as String?,
      pad: fields[13] as Pad?,
      location: fields[14] as String?,
      landing: fields[15] as String?,
      landingSuccess: fields[16] as int?,
      launcher: fields[17] as String?,
      orbit: fields[18] as String?,
      image: fields[19] as String?,
      infographic: fields[20] as String?,
      type: fields[21] as String?,
      updates: (fields[22] as List?)?.cast<Update>(),
      launchServiceProvider: fields[23] as LaunchServiceProvider?,
      rocket: fields[24] as Rocket?,
    );
  }

  @override
  void write(BinaryWriter writer, Launch obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.lastUpdated)
      ..writeByte(6)
      ..write(obj.net)
      ..writeByte(7)
      ..write(obj.netPrecision)
      ..writeByte(8)
      ..write(obj.windowEnd)
      ..writeByte(9)
      ..write(obj.windowStart)
      ..writeByte(10)
      ..write(obj.lspName)
      ..writeByte(11)
      ..write(obj.mission)
      ..writeByte(12)
      ..write(obj.missionType)
      ..writeByte(13)
      ..write(obj.pad)
      ..writeByte(14)
      ..write(obj.location)
      ..writeByte(15)
      ..write(obj.landing)
      ..writeByte(16)
      ..write(obj.landingSuccess)
      ..writeByte(17)
      ..write(obj.launcher)
      ..writeByte(18)
      ..write(obj.orbit)
      ..writeByte(19)
      ..write(obj.image)
      ..writeByte(20)
      ..write(obj.infographic)
      ..writeByte(21)
      ..write(obj.type)
      ..writeByte(22)
      ..write(obj.updates)
      ..writeByte(23)
      ..write(obj.launchServiceProvider)
      ..writeByte(24)
      ..write(obj.rocket);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LaunchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StatusAdapter extends TypeAdapter<Status> {
  @override
  final int typeId = 1;

  @override
  Status read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Status(
      id: fields[0] as int?,
      name: fields[1] as String?,
      abbrev: fields[2] as String?,
      description: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Status obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.abbrev)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NetPrecisionAdapter extends TypeAdapter<NetPrecision> {
  @override
  final int typeId = 2;

  @override
  NetPrecision read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NetPrecision(
      id: fields[0] as int?,
      name: fields[1] as String?,
      abbrev: fields[2] as String?,
      description: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NetPrecision obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.abbrev)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetPrecisionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UpdateAdapter extends TypeAdapter<Update> {
  @override
  final int typeId = 3;

  @override
  Update read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Update(
      id: fields[0] as int?,
      profileImage: fields[1] as String?,
      comment: fields[2] as String?,
      infoUrl: fields[3] as String?,
      createdBy: fields[4] as String?,
      createdOn: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Update obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.profileImage)
      ..writeByte(2)
      ..write(obj.comment)
      ..writeByte(3)
      ..write(obj.infoUrl)
      ..writeByte(4)
      ..write(obj.createdBy)
      ..writeByte(5)
      ..write(obj.createdOn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LaunchServiceProviderAdapter extends TypeAdapter<LaunchServiceProvider> {
  @override
  final int typeId = 4;

  @override
  LaunchServiceProvider read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LaunchServiceProvider(
      id: fields[0] as int?,
      url: fields[1] as String?,
      name: fields[2] as String?,
      featured: fields[3] as bool?,
      type: fields[4] as String?,
      countryCode: fields[5] as String?,
      abbrev: fields[6] as String?,
      description: fields[7] as String?,
      administrator: fields[8] as String?,
      foundingYear: fields[9] as String?,
      launchers: fields[10] as String?,
      spacecraft: fields[11] as String?,
      launchLibraryUrl: fields[12] as String?,
      totalLaunchCount: fields[13] as int?,
      consecutiveSuccessfulLaunches: fields[14] as int?,
      successfulLaunches: fields[15] as int?,
      failedLaunches: fields[16] as int?,
      pendingLaunches: fields[17] as int?,
      consecutiveSuccessfulLandings: fields[18] as int?,
      successfulLandings: fields[19] as int?,
      failedLandings: fields[20] as int?,
      attemptedLandings: fields[21] as int?,
      infoUrl: fields[22] as String?,
      wikiUrl: fields[23] as String?,
      logoUrl: fields[24] as String?,
      imageUrl: fields[25] as String?,
      nationUrl: fields[26] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LaunchServiceProvider obj) {
    writer
      ..writeByte(27)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.featured)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.countryCode)
      ..writeByte(6)
      ..write(obj.abbrev)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.administrator)
      ..writeByte(9)
      ..write(obj.foundingYear)
      ..writeByte(10)
      ..write(obj.launchers)
      ..writeByte(11)
      ..write(obj.spacecraft)
      ..writeByte(12)
      ..write(obj.launchLibraryUrl)
      ..writeByte(13)
      ..write(obj.totalLaunchCount)
      ..writeByte(14)
      ..write(obj.consecutiveSuccessfulLaunches)
      ..writeByte(15)
      ..write(obj.successfulLaunches)
      ..writeByte(16)
      ..write(obj.failedLaunches)
      ..writeByte(17)
      ..write(obj.pendingLaunches)
      ..writeByte(18)
      ..write(obj.consecutiveSuccessfulLandings)
      ..writeByte(19)
      ..write(obj.successfulLandings)
      ..writeByte(20)
      ..write(obj.failedLandings)
      ..writeByte(21)
      ..write(obj.attemptedLandings)
      ..writeByte(22)
      ..write(obj.infoUrl)
      ..writeByte(23)
      ..write(obj.wikiUrl)
      ..writeByte(24)
      ..write(obj.logoUrl)
      ..writeByte(25)
      ..write(obj.imageUrl)
      ..writeByte(26)
      ..write(obj.nationUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LaunchServiceProviderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RocketConfigurationAdapter extends TypeAdapter<RocketConfiguration> {
  @override
  final int typeId = 5;

  @override
  RocketConfiguration read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RocketConfiguration(
      id: fields[0] as int?,
      url: fields[1] as String?,
      name: fields[2] as String?,
      active: fields[3] as bool?,
      reusable: fields[4] as bool?,
      description: fields[5] as String?,
      family: fields[6] as String?,
      fullName: fields[7] as String?,
      manufacturer: fields[8] as LaunchServiceProvider?,
    );
  }

  @override
  void write(BinaryWriter writer, RocketConfiguration obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.active)
      ..writeByte(4)
      ..write(obj.reusable)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.family)
      ..writeByte(7)
      ..write(obj.fullName)
      ..writeByte(8)
      ..write(obj.manufacturer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RocketConfigurationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RocketAdapter extends TypeAdapter<Rocket> {
  @override
  final int typeId = 6;

  @override
  Rocket read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rocket(
      id: fields[0] as int?,
      configuration: fields[1] as RocketConfiguration?,
    );
  }

  @override
  void write(BinaryWriter writer, Rocket obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.configuration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RocketAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MissionAdapter extends TypeAdapter<Mission> {
  @override
  final int typeId = 7;

  @override
  Mission read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Mission(
      id: fields[0] as int?,
      name: fields[1] as String?,
      description: fields[2] as String?,
      launchDesignator: fields[3] as String?,
      type: fields[4] as String?,
      orbit: fields[5] as Orbit?,
      agencies: (fields[6] as List?)?.cast<Agency>(),
      infoUrls: (fields[7] as List?)?.cast<InfoUrl>(),
      vidUrls: (fields[8] as List?)?.cast<VideoUrl>(),
    );
  }

  @override
  void write(BinaryWriter writer, Mission obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.launchDesignator)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.orbit)
      ..writeByte(6)
      ..write(obj.agencies)
      ..writeByte(7)
      ..write(obj.infoUrls)
      ..writeByte(8)
      ..write(obj.vidUrls);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MissionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrbitAdapter extends TypeAdapter<Orbit> {
  @override
  final int typeId = 8;

  @override
  Orbit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Orbit(
      id: fields[0] as int?,
      name: fields[1] as String?,
      abbrev: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Orbit obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.abbrev);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrbitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AgencyAdapter extends TypeAdapter<Agency> {
  @override
  final int typeId = 9;

  @override
  Agency read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Agency(
      id: fields[0] as int?,
      url: fields[1] as String?,
      name: fields[2] as String?,
      featured: fields[3] as bool?,
      type: fields[4] as String?,
      countryCode: fields[5] as String?,
      abbrev: fields[6] as String?,
      description: fields[7] as String?,
      administrator: fields[8] as String?,
      foundingYear: fields[9] as String?,
      launchers: fields[10] as String?,
      spacecraft: fields[11] as String?,
      launchLibraryUrl: fields[12] as String?,
      totalLaunchCount: fields[13] as int?,
      consecutiveSuccessfulLaunches: fields[14] as int?,
      successfulLaunches: fields[15] as int?,
      failedLaunches: fields[16] as int?,
      pendingLaunches: fields[17] as int?,
      consecutiveSuccessfulLandings: fields[18] as int?,
      successfulLandings: fields[19] as int?,
      failedLandings: fields[20] as int?,
      attemptedLandings: fields[21] as int?,
      infoUrl: fields[22] as String?,
      wikiUrl: fields[23] as String?,
      logoUrl: fields[24] as String?,
      imageUrl: fields[25] as String?,
      nationUrl: fields[26] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Agency obj) {
    writer
      ..writeByte(27)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.featured)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.countryCode)
      ..writeByte(6)
      ..write(obj.abbrev)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.administrator)
      ..writeByte(9)
      ..write(obj.foundingYear)
      ..writeByte(10)
      ..write(obj.launchers)
      ..writeByte(11)
      ..write(obj.spacecraft)
      ..writeByte(12)
      ..write(obj.launchLibraryUrl)
      ..writeByte(13)
      ..write(obj.totalLaunchCount)
      ..writeByte(14)
      ..write(obj.consecutiveSuccessfulLaunches)
      ..writeByte(15)
      ..write(obj.successfulLaunches)
      ..writeByte(16)
      ..write(obj.failedLaunches)
      ..writeByte(17)
      ..write(obj.pendingLaunches)
      ..writeByte(18)
      ..write(obj.consecutiveSuccessfulLandings)
      ..writeByte(19)
      ..write(obj.successfulLandings)
      ..writeByte(20)
      ..write(obj.failedLandings)
      ..writeByte(21)
      ..write(obj.attemptedLandings)
      ..writeByte(22)
      ..write(obj.infoUrl)
      ..writeByte(23)
      ..write(obj.wikiUrl)
      ..writeByte(24)
      ..write(obj.logoUrl)
      ..writeByte(25)
      ..write(obj.imageUrl)
      ..writeByte(26)
      ..write(obj.nationUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AgencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InfoUrlAdapter extends TypeAdapter<InfoUrl> {
  @override
  final int typeId = 10;

  @override
  InfoUrl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InfoUrl(
      priority: fields[0] as int?,
      source: fields[1] as String?,
      title: fields[2] as String?,
      description: fields[3] as String?,
      featureImage: fields[4] as String?,
      url: fields[5] as String?,
      type: fields[6] as InfoUrlType?,
      language: fields[7] as Language?,
    );
  }

  @override
  void write(BinaryWriter writer, InfoUrl obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.priority)
      ..writeByte(1)
      ..write(obj.source)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.featureImage)
      ..writeByte(5)
      ..write(obj.url)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfoUrlAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InfoUrlTypeAdapter extends TypeAdapter<InfoUrlType> {
  @override
  final int typeId = 11;

  @override
  InfoUrlType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InfoUrlType(
      id: fields[0] as int?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, InfoUrlType obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfoUrlTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LanguageAdapter extends TypeAdapter<Language> {
  @override
  final int typeId = 12;

  @override
  Language read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Language(
      id: fields[0] as int?,
      name: fields[1] as String?,
      code: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Language obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VideoUrlAdapter extends TypeAdapter<VideoUrl> {
  @override
  final int typeId = 13;

  @override
  VideoUrl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VideoUrl(
      priority: fields[0] as int?,
      source: fields[1] as String?,
      publisher: fields[2] as String?,
      title: fields[3] as String?,
      description: fields[4] as String?,
      featureImage: fields[5] as String?,
      url: fields[6] as String?,
      type: fields[7] as InfoUrlType?,
      language: fields[8] as Language?,
      startTime: fields[9] as DateTime?,
      endTime: fields[10] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, VideoUrl obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.priority)
      ..writeByte(1)
      ..write(obj.source)
      ..writeByte(2)
      ..write(obj.publisher)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.featureImage)
      ..writeByte(6)
      ..write(obj.url)
      ..writeByte(7)
      ..write(obj.type)
      ..writeByte(8)
      ..write(obj.language)
      ..writeByte(9)
      ..write(obj.startTime)
      ..writeByte(10)
      ..write(obj.endTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoUrlAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PadLocationAdapter extends TypeAdapter<PadLocation> {
  @override
  final int typeId = 14;

  @override
  PadLocation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PadLocation(
      id: fields[0] as int?,
      url: fields[1] as String?,
      name: fields[2] as String?,
      countryCode: fields[3] as String?,
      description: fields[4] as String?,
      mapImage: fields[5] as String?,
      timezoneName: fields[6] as String?,
      totalLaunchCount: fields[7] as int?,
      totalLandingCount: fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PadLocation obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.countryCode)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.mapImage)
      ..writeByte(6)
      ..write(obj.timezoneName)
      ..writeByte(7)
      ..write(obj.totalLaunchCount)
      ..writeByte(8)
      ..write(obj.totalLandingCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PadLocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PadAdapter extends TypeAdapter<Pad> {
  @override
  final int typeId = 15;

  @override
  Pad read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pad(
      id: fields[0] as int?,
      url: fields[1] as String?,
      agencyId: fields[2] as int?,
      name: fields[3] as String?,
      description: fields[4] as String?,
      infoUrl: fields[5] as String?,
      wikiUrl: fields[6] as String?,
      mapUrl: fields[7] as String?,
      latitude: fields[8] as String?,
      longitude: fields[9] as String?,
      location: fields[10] as PadLocation?,
      countryCode: fields[11] as String?,
      mapImage: fields[12] as String?,
      totalLaunchCount: fields[13] as int?,
      orbitalLaunchAttemptCount: fields[14] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Pad obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.agencyId)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.infoUrl)
      ..writeByte(6)
      ..write(obj.wikiUrl)
      ..writeByte(7)
      ..write(obj.mapUrl)
      ..writeByte(8)
      ..write(obj.latitude)
      ..writeByte(9)
      ..write(obj.longitude)
      ..writeByte(10)
      ..write(obj.location)
      ..writeByte(11)
      ..write(obj.countryCode)
      ..writeByte(12)
      ..write(obj.mapImage)
      ..writeByte(13)
      ..write(obj.totalLaunchCount)
      ..writeByte(14)
      ..write(obj.orbitalLaunchAttemptCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
