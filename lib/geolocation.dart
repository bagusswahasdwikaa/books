import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';

  @override
  void initState() {
    super.initState();
    getPosition().then((myPos) {
      if (myPos != null) {
        setState(() {
          myPosition =
              'Latitude: ${myPos.latitude.toString()} - Longitude: ${myPos.longitude.toString()}';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final myWidget = myPosition == ''
        ? const CircularProgressIndicator()
        : Text(myPosition);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Location : Bagus Wahasdwika'),
      ),
      body: Center(
        child: Center(child: myWidget),
      ),
    );
  }

  Future<Position?> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Memberikan delay selama 3 detik
    await Future.delayed(const Duration(seconds: 3));

    // Memeriksa apakah layanan lokasi aktif
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null; // Lokasi tidak aktif
    }

    // Meminta izin lokasi
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return null; // Izin ditolak
    }

    // Jika izin diberikan, ambil lokasi saat ini
    return await Geolocator.getCurrentPosition();
  }
}
