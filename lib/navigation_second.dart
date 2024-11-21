import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Screen Bagus Wahasdwika',
        style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Purple'),
              onPressed: () {
                Navigator.pop(context, const Color.fromARGB(255, 126, 47, 211));
              },
            ),
            ElevatedButton(
              child: const Text('Blue Ocean'),
              onPressed: () {
                Navigator.pop(context, const Color.fromARGB(255, 35, 155, 195));
              },
            ),
            ElevatedButton(
              child: const Text('Yellow'),
              onPressed: () {
                Navigator.pop(context, const Color.fromARGB(255, 192, 140, 0));
              },
            ),
          ],
        ),
      ),
    );
  }
}
