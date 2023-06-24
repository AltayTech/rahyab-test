import 'dart:convert';

import '../../domain/entities/team_entity.dart';

class TeamModel extends TeamEntity {
  final int id;
  final String name;
  final String details;
  final String icon;
  final bool isActive;
  final String color;
  final String backgroundItem;

  TeamModel({
    required this.id,
    required this.name,
    required this.details,
    required this.icon,
    required this.isActive,
    required this.color,
    required this.backgroundItem,
  });

  TeamModel copyWith({
    int? id,
    String? name,
    String? details,
    String? icon,
    bool? isActive,
    String? color,
    String? backgroundItem,
  }) =>
      TeamModel(
        id: id ?? this.id,
        name: name ?? this.name,
        details: details ?? this.details,
        icon: icon ?? this.icon,
        isActive: isActive ?? this.isActive,
        color: color ?? this.color,
        backgroundItem: backgroundItem ?? this.backgroundItem,
      );

  factory TeamModel.fromRawJson(String str) =>
      TeamModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
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
