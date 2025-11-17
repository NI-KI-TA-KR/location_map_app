import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:test_flutter_map/core/di/injectable.dart';
import 'package:test_flutter_map/core/extensions/context_x.dart';
import 'package:test_flutter_map/core/theme/app_theme.dart';
import 'package:test_flutter_map/core/theme/theme_cubit/theme_cubit.dart';
import 'package:test_flutter_map/features/map/domain/bloc/map_location_cubit.dart';
import 'package:test_flutter_map/features/map/presentation/widgets/app_drower.dart';
import 'package:test_flutter_map/features/map/presentation/widgets/app_loader.dart';
import 'package:test_flutter_map/features/map/presentation/widgets/custom_marker_cluster_widget.dart';
import 'package:test_flutter_map/features/map/presentation/widgets/custom_marker_widget.dart';
import 'package:test_flutter_map/features/map/presentation/widgets/draggable_point_sheet.dart';
import 'package:test_flutter_map/features/map/presentation/widgets/error_widget.dart';
import 'package:test_flutter_map/features/map/presentation/widgets/menu_drawer_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  static const path = '/';

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    final colorSchemeX = context.colorSchemeExtension;
    return Scaffold(
      backgroundColor: colorSchemeX.appBar,
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: BlocBuilder<MapLocationCubit, MapLocationState>(
              bloc: di<MapLocationCubit>(),
              builder: (context, state) {
                if (state is MapLocationLoading) {
                  return AppLoader();
                }
                if (state is MapLocationLoaded) {
                  return Stack(
                    children: [
                      BlocBuilder<ThemeCubit, ThemeData>(
                        bloc: di<ThemeCubit>(),
                        builder: (context, asyncSnapshot) {
                          return FlutterMap(
                            options: const MapOptions(
                              initialCenter: LatLng(50.4501, 30.5234),
                              initialZoom: 13,
                            ),
                            children: [
                              TileLayer(urlTemplate: AppTheme.mapStyle),
                              MarkerClusterLayerWidget(
                                options: MarkerClusterLayerOptions(
                                  maxClusterRadius: 120,
                                  disableClusteringAtZoom: 18,
                                  builder: (context, markers) {
                                    return CustomMarkerClusterWidget(count: markers.length);
                                  },
                                  size: Size(50, 50),
                                  markers: state.points.map((point) {
                                    return Marker(
                                      width: 70,
                                      height: 70,
                                      point: LatLng(point.lat, point.lng),
                                      child: CustomMarkerWidget(item: point),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      Positioned(
                        left: 20,
                        top: 20,
                        child: MenuDrowerWidget(onTap: () => Scaffold.of(context).openDrawer()),
                      ),
                      DraggablePointSheet(items: state.points),
                    ],
                  );
                }
                return ErrorWIdget();
              },
            ),
          );
        },
      ),
      drawer: AppDrawer(),
    );
  }
}
