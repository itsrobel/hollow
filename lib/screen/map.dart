import 'package:flutter/material.dart';
import 'package:hollow_flutter/widget/drawer.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart' as latLng;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  void showDrawer() {
    print('tapped on show drawer!');
    setState(() {
      _showDrawer = !_showDrawer;
    });
  }

  @override
  void initState() {
    super.initState();
    // print(lat);
    // print(lng);
    WidgetsBinding.instance!.addPostFrameCallback((_) => {
          getLocationData().then((data) {
            lat = data.latitude;
            lng = data.longitude;
            print(lat);
            print(lng);
          })
        });
    // getLocationData().then((data) {
    //   print(data);
    // });
  }

  Future getLocationData() async {
    var location = Location();
    var sericeEnabled = await location.serviceEnabled();
    if (!sericeEnabled) {
      sericeEnabled = await location.requestService();
    }

    // location.requestPermission();
    var permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }

    var currentLocation = await location.getLocation();
    // print(currentLocation);
    return currentLocation;
  }
  // void updateLocation() {
  //   print(lat);
  //   print(lng);
  //   var currentLocation = getLocationData();
  //   lat = currentLocation.latitude;
  //   lng = currentLocation.longitude;
  // }

  double lat = 51;
  double lng = -0.9;
  bool _showDrawer = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Map'),
              centerTitle: true,
              backgroundColor: Color(0xff251F34),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: showDrawer,
              backgroundColor: Color(0xff251F34),
              child: Icon(
                Icons.menu_rounded,
              ),
            ),
            body: MapContainer(lat: lat, lng: lng)),
        if (_showDrawer)
          DrawerWidget(
            closeFunction: showDrawer,
          ),
      ],
    );
  }
}

class MapContainer extends StatelessWidget {
  const MapContainer({
    Key? key,
    required this.lat,
    required this.lng,
  }) : super(key: key);
  final double lat;
  final double lng;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: latLng.LatLng(lat, lng),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
          attributionBuilder: (_) {
            return Text("");
          },
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: latLng.LatLng(lat, lng),
              builder: (ctx) => Container(
                child: FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
