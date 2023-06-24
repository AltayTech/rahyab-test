import 'package:equatable/equatable.dart';

class TeamEntity extends Equatable {
  final int? id;
  final String? name;
  final String? details;
  final String? icon;
  final bool? isActive;
  final String? color;
  final String? backgroundItem;

  const TeamEntity({
    this.id,
    this.name,
    this.details,
    this.icon,
    this.isActive,
    this.color,
    this.backgroundItem,
  });

  @override
  List<Object?> get props => [];
}
