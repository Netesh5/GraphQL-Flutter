class GeoModel {
  Data? data;

  GeoModel({this.data});

  GeoModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Continents>? continents;

  Data({this.continents});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['continents'] != null) {
      continents = <Continents>[];
      json['continents'].forEach((v) {
        continents!.add(Continents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (continents != null) {
      data['continents'] = continents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Continents {
  String? name;
  List<Countries>? countries;

  Continents({this.name, this.countries});

  Continents.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (countries != null) {
      data['countries'] = countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countries {
  String? name;

  Countries({this.name});

  Countries.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
