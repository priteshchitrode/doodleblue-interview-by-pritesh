class MobileDevicesModel {
  MobileDevicesModel({
    required this.id,
    required this.name,
    required this.data,
  });

  final String id;
  final String name;
  final Data? data;

  MobileDevicesModel copyWith({
    String? id,
    String? name,
    Data? data,
  }) {
    return MobileDevicesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      data: data ?? this.data,
    );
  }

  factory MobileDevicesModel.fromJson(Map<String, dynamic> json){
    return MobileDevicesModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "data": data?.toJson(),
  };

}

class Data {
  Data({
    required this.dataColor,
    required this.dataCapacity,
    required this.capacityGb,
    required this.dataPrice,
    required this.dataGeneration,
    required this.year,
    required this.cpuModel,
    required this.hardDiskSize,
    required this.strapColour,
    required this.caseSize,
    required this.color,
    required this.description,
    required this.capacity,
    required this.screenSize,
    required this.generation,
    required this.price,
  });

  final String dataColor;
  final String dataCapacity;
  final num capacityGb;
  final num dataPrice;
  final String dataGeneration;
  final num year;
  final String cpuModel;
  final String hardDiskSize;
  final String strapColour;
  final String caseSize;
  final String color;
  final String description;
  final String capacity;
  final num screenSize;
  final String generation;
  final String price;

  Data copyWith({
    String? dataColor,
    String? dataCapacity,
    num? capacityGb,
    num? dataPrice,
    String? dataGeneration,
    num? year,
    String? cpuModel,
    String? hardDiskSize,
    String? strapColour,
    String? caseSize,
    String? color,
    String? description,
    String? capacity,
    num? screenSize,
    String? generation,
    String? price,
  }) {
    return Data(
      dataColor: dataColor ?? this.dataColor,
      dataCapacity: dataCapacity ?? this.dataCapacity,
      capacityGb: capacityGb ?? this.capacityGb,
      dataPrice: dataPrice ?? this.dataPrice,
      dataGeneration: dataGeneration ?? this.dataGeneration,
      year: year ?? this.year,
      cpuModel: cpuModel ?? this.cpuModel,
      hardDiskSize: hardDiskSize ?? this.hardDiskSize,
      strapColour: strapColour ?? this.strapColour,
      caseSize: caseSize ?? this.caseSize,
      color: color ?? this.color,
      description: description ?? this.description,
      capacity: capacity ?? this.capacity,
      screenSize: screenSize ?? this.screenSize,
      generation: generation ?? this.generation,
      price: price ?? this.price,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      dataColor: json["color"] ?? "",
      dataCapacity: json["capacity"] ?? "",
      capacityGb: json["capacity GB"] ?? 0,
      dataPrice: json["price"] ?? 0,
      dataGeneration: json["generation"] ?? "",
      year: json["year"] ?? 0,
      cpuModel: json["CPU model"] ?? "",
      hardDiskSize: json["Hard disk size"] ?? "",
      strapColour: json["Strap Colour"] ?? "",
      caseSize: json["Case Size"] ?? "",
      color: json["Color"] ?? "",
      description: json["Description"] ?? "",
      capacity: json["Capacity"] ?? "",
      screenSize: json["Screen size"] ?? 0,
      generation: json["Generation"] ?? "",
      price: json["Price"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "color": dataColor,
    "capacity": dataCapacity,
    "capacity GB": capacityGb,
    "price": dataPrice,
    "generation": dataGeneration,
    "year": year,
    "CPU model": cpuModel,
    "Hard disk size": hardDiskSize,
    "Strap Colour": strapColour,
    "Case Size": caseSize,
    "Color": color,
    "Description": description,
    "Capacity": capacity,
    "Screen size": screenSize,
    "Generation": generation,
    "Price": price,
  };

}
