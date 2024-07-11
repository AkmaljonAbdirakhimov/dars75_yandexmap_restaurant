import 'dart:math';

import 'package:dars75_yandexmap_restaurant/services/yandex_map_service.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final searchContoller = TextEditingController();
  late YandexMapController mapController;
  List<SuggestItem> suggestions = [];
  Point? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: onMapCreated,
            onCameraPositionChanged: onCameraPositionChanged,
          ),
          if (selectedLocation != null)
            Align(
              child: Image.asset(
                "assets/pin.png",
                width: 50,
              ),
            ),
          Align(
            alignment: const Alignment(0, -0.8),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: searchContoller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: getSearchSuggestions,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight:
                          (70 * suggestions.length).clamp(0, 300).toDouble(),
                    ),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                      itemCount: suggestions.length,
                      itemExtent: 60,
                      itemBuilder: (ctx, index) {
                        final suggestion = suggestions[index];
                        return ListTile(
                          onTap: () {
                            goToLocation(suggestion.center);
                          },
                          title: Text(suggestion.displayText),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  void onMapCreated(YandexMapController controller) async {
    mapController = controller;
    await mapController.toggleUserLayer(
      visible: true,
      headingEnabled: true,
      autoZoomEnabled: true,
    );
    setState(() {});
  }

  void onCameraPositionChanged(
    CameraPosition position,
    CameraUpdateReason reason,
    bool finished,
  ) {
    if (reason == CameraUpdateReason.gestures) {
      setState(() {
        selectedLocation = position.target;
      });
    }
  }

  void getSearchSuggestions(String address) async {
    suggestions = await YandexMapService.getSearchSuggestions(address);
    setState(() {});
  }

  void goToLocation(Point? location) async {
    if (location != null) {
      setState(() {
        selectedLocation = location;
        suggestions = [];
      });
      await mapController.moveCamera(
        animation: const MapAnimation(
          type: MapAnimationType.smooth,
        ),
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: location,
            zoom: 15,
          ),
        ),
      );
    }
  }
}
