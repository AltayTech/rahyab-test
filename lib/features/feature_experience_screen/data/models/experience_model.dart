import 'dart:convert';

import '../../domain/entities/experience_entity.dart';

class ExperienceModel extends ExperienceEntity {
  final int id;
  final String name;
  final String details;
  final String icon;
  final bool isActive;
  final String color;
  final String backgroundItem;

  ExperienceModel({
    required this.id,
    required this.name,
    required this.details,
    required this.icon,
    required this.isActive,
    required this.color,
    required this.backgroundItem,
  });

  ExperienceModel copyWith({
    int? id,
    String? name,
    String? details,
    String? icon,
    bool? isActive,
    String? color,
    String? backgroundItem,
  }) =>
      ExperienceModel(
        id: id ?? this.id,
        name: name ?? this.name,
        details: details ?? this.details,
        icon: icon ?? this.icon,
        isActive: isActive ?? this.isActive,
        color: color ?? this.color,
        backgroundItem: backgroundItem ?? this.backgroundItem,
      );

  factory ExperienceModel.fromRawJson(String str) =>
      ExperienceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      ExperienceModel(
        id: json["id"],
        name: json["name"],
        details: json["details"],
        icon: json["icon"],
        isActive: json["is_active"],
        color: json["color"],
        backgroundItem: json["background_item"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "details": details,
        "icon": icon,
        "is_active": isActive,
        "color": color,
        "background_item": backgroundItem,
      };
}
