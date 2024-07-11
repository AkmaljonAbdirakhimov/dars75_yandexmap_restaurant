import 'package:dars75_yandexmap_restaurant/services/yandex_map_service.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late YandexMapController mapController;
  final searchContoller = TextEditingController();

  List<SuggestItem> suggestions = [];

  void onMapCreated(YandexMapController controller) {
    mapController = controller;
    setState(() {});
  }

  void getSearchSuggestions(String address) async {
    suggestions = await YandexMapService.getSearchSuggestions(address);
    setState(() {});
  }

  void goToLocation(Point? location) {
    if (location != null) {
      mapController.moveCamera(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: onMapCreated,
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
                    constraints: const BoxConstraints(
                      maxHeight: 300,
                    ),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                      itemCount: suggestions.length,
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
    );
  }
}
