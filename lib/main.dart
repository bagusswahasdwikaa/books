import 'dart:async';
import 'dart:io';
import 'package:books/navigation_first.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'geolocation.dart';
import 'navigation_first.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sukma Bagus Wahasdwika',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const NavigationFirst(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Back from the Future',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            // PRAKTIKUM 1:
            // ElevatedButton(
            //   child: const Text('GO!'),
            //   onPressed: () {
            //     setState(() {});
            //     getData()
            //     .then((value) {
            //       result = value.body.toString().substring(0, 450);
            //       setState(() {});
            //     }).catchError((_){
            //       result = 'An error occurred';
            //       setState(() {});
            //     });
            //   },
            // ),
            
            // PRAKTIKUM 2:
            // ElevatedButton(
            //   child: const Text('GO!'),
            //   onPressed: () {
            //     count();
            //   },
            // ),

            // PRAKTIKUM 3:
            // ElevatedButton(
            //   child: const Text('GO!'),
            //   onPressed: () {
            //     getNumber().then((value) {
            //       setState(() {
            //         result = value.toString();
            //       });
            //     }).catchError((e) {
            //       result = 'An error occurred';
            //     });
            //   },
            // ),

            // PRAKTIKUM 4:
            // ElevatedButton(
            //   child: const Text('GO!'),
            //   onPressed: () {
            //     returnFG();
            //   }
            // ),

            // PRAKTIKUM 5:
            ElevatedButton(
              child: const Text('GO!'),
              onPressed: () {
                handleError();
              },
            ),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/R4qsDwAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }

  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }

  late Completer completer;

  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  Future calculate() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
    } catch (_) {
      completer.completeError({});
    }
  }

  Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something terrible happened!');
  }

  Future handleError() async {
    try {
      await returnError();
    } catch (error) {
      setState(() {
        result = error.toString();
      });
    } finally {
      print('Complete');
    }
  }
}
