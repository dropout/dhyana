import 'package:core/src/domain/entity/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as flutter_map_latlng;

enum MapStyle { street, light, dark }

class const AppMap({
  required final String name,
  required final double latitude,
  required final double longitude,
  final double zoom = 13,
  final MapStyle mapStyle = .street,
  super.key,
}) extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final center = flutter_map_latlng.LatLng(latitude, longitude);

    final urlTemplate = switch (mapStyle) {
      MapStyle.street => 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      MapStyle.light => 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png',
      MapStyle.dark => 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png',
    };

    return FlutterMap(
      options: MapOptions(
        initialCenter: center,
        initialZoom: zoom,
        interactionOptions: InteractionOptions(
          flags: InteractiveFlag.none,
        )
      ),
      children: [
        TileLayer(
          urlTemplate: urlTemplate,
          subdomains: const ['a', 'b', 'c', 'd'],
          userAgentPackageName: 'com.dhyana.app',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: center,
              width: 220,
              height: 62,
              child: _LocationPin(name: name),
            ),
          ],
        ),
      ],
    );
  }
}

class _LocationPin extends StatelessWidget {
  const _LocationPin({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                blurRadius: 20,
                offset: Offset(0, 0),
                color: Colors.black45,
              ),
            ],
          ),
          child: Text(
            name,
            maxLines: 1,            
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -1),
          child: CustomPaint(
            size: const Size(20, 12),
            painter: _SpeechBubbleTailPainter(),
          ),
        ),
      ],
    );
  }
}

class _SpeechBubbleTailPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      // ..color = Colors.redAccent
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2 - 10, 0)
      ..lineTo(size.width / 2 + 10, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

extension AppMapLocationX on Location {
  AppMap toAppMap() => AppMap(
        name: name,
        latitude: latLng.latitude,
        longitude: latLng.longitude,
      );
}


