part of 'map_location_cubit.dart';

abstract class MapLocationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MapLocationLoading extends MapLocationState {}

class MapLocationLoaded extends MapLocationState {
  final List<LocationPointData> points;

  MapLocationLoaded(this.points);

  @override
  List<Object?> get props => [points];
}

class MapLocationError extends MapLocationState {}
