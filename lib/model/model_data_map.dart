class MapData {
  int? status;
  List<Data>? data;

  MapData({this.status, this.data});

  MapData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? uuid;
  String? displayName;
  Null? narrativeDescription;
  String? tacticalDescription;
  String? coordinates;
  String? displayIcon;
  String? listViewIcon;
  String? listViewIconTall;
  String? splash;
  String? stylizedBackgroundImage;
  String? premierBackgroundImage;
  String? assetPath;
  String? mapUrl;
  double? xMultiplier;
  double? yMultiplier;
  double? xScalarToAdd;
  double? yScalarToAdd;
  List<Callouts>? callouts;

  Data(
      {this.uuid,
        this.displayName,
        this.narrativeDescription,
        this.tacticalDescription,
        this.coordinates,
        this.displayIcon,
        this.listViewIcon,
        this.listViewIconTall,
        this.splash,
        this.stylizedBackgroundImage,
        this.premierBackgroundImage,
        this.assetPath,
        this.mapUrl,
        this.xMultiplier,
        this.yMultiplier,
        this.xScalarToAdd,
        this.yScalarToAdd,
        this.callouts});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    narrativeDescription = json['narrativeDescription'];
    tacticalDescription = json['tacticalDescription'];
    coordinates = json['coordinates'];
    displayIcon = json['displayIcon'];
    listViewIcon = json['listViewIcon'];
    listViewIconTall = json['listViewIconTall'];
    splash = json['splash'];
    stylizedBackgroundImage = json['stylizedBackgroundImage'];
    premierBackgroundImage = json['premierBackgroundImage'];
    assetPath = json['assetPath'];
    mapUrl = json['mapUrl'];
    xMultiplier = json['xMultiplier'];
    yMultiplier = json['yMultiplier'];
    xScalarToAdd = json['xScalarToAdd'];
    yScalarToAdd = json['yScalarToAdd'];
    if (json['callouts'] != null) {
      callouts = <Callouts>[];
      json['callouts'].forEach((v) {
        callouts!.add(new Callouts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['displayName'] = this.displayName;
    data['narrativeDescription'] = this.narrativeDescription;
    data['tacticalDescription'] = this.tacticalDescription;
    data['coordinates'] = this.coordinates;
    data['displayIcon'] = this.displayIcon;
    data['listViewIcon'] = this.listViewIcon;
    data['listViewIconTall'] = this.listViewIconTall;
    data['splash'] = this.splash;
    data['stylizedBackgroundImage'] = this.stylizedBackgroundImage;
    data['premierBackgroundImage'] = this.premierBackgroundImage;
    data['assetPath'] = this.assetPath;
    data['mapUrl'] = this.mapUrl;
    data['xMultiplier'] = this.xMultiplier;
    data['yMultiplier'] = this.yMultiplier;
    data['xScalarToAdd'] = this.xScalarToAdd;
    data['yScalarToAdd'] = this.yScalarToAdd;
    if (this.callouts != null) {
      data['callouts'] = this.callouts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Callouts {
  String? regionName;
  String? superRegionName;
  Location? location;

  Callouts({this.regionName, this.superRegionName, this.location});

  Callouts.fromJson(Map<String, dynamic> json) {
    regionName = json['regionName'];
    superRegionName = json['superRegionName'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regionName'] = this.regionName;
    data['superRegionName'] = this.superRegionName;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Location {
  double? x;
  double? y;

  Location({this.x, this.y});

  Location.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}