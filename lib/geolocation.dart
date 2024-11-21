import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Future<Position>? position;

  @override
  void initState() {
    super.initState();
    position = getPosition();  // Menyimpan Future di variabel position
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Future Builder : Bagus Wahasdwika',
      style: TextStyle(
            color: Colors.white, 
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: FutureBuilder<Position>(
          future: position, // Menggunakan position yang sudah diinisialisasi
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                // Menampilkan latitude dan longitude jika data tersedia
                return Text('Latitude: ${snapshot.data!.latitude}, Longitude: ${snapshot.data!.longitude}');
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Menunggu data
            }
            else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Something terrible happened!');
              }
              return Text(snapshot.data.toString());
            }
            return const Text(''); // Menampilkan teks kosong jika tidak ada data
          },
        ),
      ),
    );
  }

  Future<Position> getPosition() async {
    // Memastikan layanan lokasi aktif
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Layanan lokasi tidak aktif");
    }

    // Meminta izin lokasi
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception("Izin lokasi ditolak");
    }

    // Menunggu beberapa detik dan mendapatkan posisi saat ini
    await Future.delayed(const Duration(seconds: 3));
    return await Geolocator.getCurrentPosition();
  }
}
