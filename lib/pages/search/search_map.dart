import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchMap extends StatefulWidget {
  final LatLng latLong;

  const SearchMap({
    super.key,
    required this.latLong,
  });

  @override
  State<SearchMap> createState() => CategoryMapState();
}

class CategoryMapState extends State<SearchMap> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  Set<Marker> markers = {};

  Future<void> addMarker(String title, String address) async {
    List<Location> locations = await locationFromAddress(address);
    if (locations.isEmpty) {
      print('não encontrado');
      return;
    }

    markers.add(
      Marker(
        markerId: MarkerId(title.replaceAll(' ', '-')),
        position: LatLng(
          locations[0].latitude,
          locations[0].longitude
        ),
        infoWindow: InfoWindow(
          title: title,
        ),
      ),
    );
  }

  loadMarkers() async {
    await addMarker('GBarbosa', 'Av. Rio Branco, 614 A, Arapiraca - AL');
    await addMarker('Atacadão', 'Rodovia AL-220, 359, Itapoã, Arapiraca - AL');
    await addMarker('Assaí Atacadista', 'R. Maria Genusir Soares, 308 (Rod. AL-220), Planalto, Arapiraca - AL');
    await addMarker('Supermercados São Luiz', 'Av. Miguel Correia de Amorim, 1204, Baixão, Arapiraca - AL');
    await addMarker('Supermercado São Luiz (filial)', 'Av. Pio XII, 1057, Bom Sucesso, Arapiraca - AL');
    await addMarker('Supermercado São Luiz (Santa Edwiges)', 'R. João Batista da Silva, 227, Santa Edwiges, Arapiraca - AL');
    await addMarker('Supermercado São Luiz (Boa Vista)', 'R. Pedro Simão, 56, Boa Vista, Arapiraca - AL');
    await addMarker('Supermercado São Luiz (Olho d’Água dos Cazuzinhas)', 'R. Coronel Vicente Ramos, 1649, Olho d’Água dos Cazuzinhas, Arapiraca - AL');
    await addMarker('Supermercado São Luiz (Brasília)', 'Av. Deputada Ceci Cunha, 396, Brasília, Arapiraca - AL');
    await addMarker('Supermercado Master', 'Rua Antonio Pereira de Albuquerque, 12, Eldorado, Arapiraca - AL');
    setState(() {});
  }

  @override
  void initState() {
    loadMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        // backgroundColor: Color(0xFFEF233C),
        title: Text(
          'Mercados próximos:',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: widget.latLong,
          zoom: 14.5,
        ),
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
