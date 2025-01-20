import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../domain/entities/vehicle_entity.dart';

class VehicleDetailsScreen extends StatefulWidget {
  const VehicleDetailsScreen({super.key, required this.vehicle});

  final VehicleEntity vehicle;

  static Route route(RouteSettings routeSettings) {
    final VehicleEntity vehicle = routeSettings.arguments as VehicleEntity;
    return MaterialPageRoute(
      builder: (_) => VehicleDetailsScreen(
        vehicle: vehicle,
      ),
    );
  }

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  late final MapController _mapController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mapController = MapController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LatLng lastLocation =
        LatLng(widget.vehicle.latitude ?? 0.0, widget.vehicle.longitude ?? 0.0);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.vehicle.name,
                style: TextStyle(
                  backgroundColor:
                      Theme.of(context).colorScheme.secondary.withAlpha(100),
                ),
              ),
              background: Hero(
                transitionOnUserGestures: true,
                tag: widget.vehicle.id,
                child: Image.network(widget.vehicle.imgUrl ?? '',
                    fit: BoxFit.cover),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListTile(
                  title: Text(widget.vehicle.name),
                  subtitle: Text(widget.vehicle.locationName),
                  trailing: Text(widget.vehicle.status),
                ),
                buildAnalyticsContainer(),
                buildMapContainer(lastLocation),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMapContainer(LatLng lastLocation) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.3,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: lastLocation,
          initialZoom: 13.0,
          minZoom: 1.0,
          maxZoom: 150.0,

        ),
        children: [
          TileLayer(
            urlTemplate:
            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 200.0,
                height: 100.0,
                rotate: true,
                point: lastLocation,
                child: Column(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 40.0,
                      color: Colors.red,
                    ),
                    Text(
                      widget.vehicle.locationName,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAnalyticsContainer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Fuel Level',
                style: const TextStyle(fontSize: 24),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: 100,
                      ranges: <GaugeRange>[
                        GaugeRange(startValue: 0, endValue: 50, color: Colors.red),
                        GaugeRange(startValue: 50, endValue: 80, color: Colors.yellow),
                        GaugeRange(startValue: 80, endValue: 100, color: Colors.green),
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(value: widget.vehicle.fuelLevel ?? 0.0),
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Text(
                            '${widget.vehicle.fuelLevel?.toStringAsFixed(1)}%',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0.5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Engine Temperature',
                style: const TextStyle(fontSize: 24),
              ),
              SfLinearGauge(
                minimum: 0,
                maximum: 100,
                interval: 10,
                orientation: LinearGaugeOrientation.horizontal,
                labelOffset: 10,
                // pointer: LinearBarPointer(
                //   value: engineTemperature,
                //   color: engineTemperature > 75 ? Colors.red : Colors.green,
                //   thickness: 10,
                // ),
                showAxisTrack: true,
                showLabels: true,
                showTicks: true,
                markerPointers: [
                  LinearShapePointer(
                    value: widget.vehicle.engineTemp ?? 0.0,
                    shapeType: LinearShapePointerType.triangle,
                    color: (widget.vehicle.engineTemp ?? 0.0) > 60 ? Colors.red : Colors.green,
                  ),
                ],
                tickOffset: 10,
                barPointers: [
                  LinearBarPointer(
                    value: widget.vehicle.engineTemp ?? 0.0,
                    color: (widget.vehicle.engineTemp ?? 0.0) > 60 ? Colors.red : Colors.green,
                  ),
                ],
                axisLabelStyle: const TextStyle(fontSize: 12),
                tickPosition: LinearElementPosition.outside,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "${widget.vehicle.engineTemp?.toStringAsFixed(1)}°C",
            style: const TextStyle(fontSize: 24),
          ),

        ],
      ),
    );
  }
}
