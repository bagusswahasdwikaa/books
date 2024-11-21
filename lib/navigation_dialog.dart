import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = const Color.fromARGB(59, 66, 48, 97);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color,
        appBar: AppBar(
          title: const Text('Navigation Dialog Screen Bagus Wahasdwika', 
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 159, 243),),
        body: Center(
          child: ElevatedButton(
              child: const Text('Change Color'), 
              onPressed: () {
                _showColorDialog(context);
              }),
        ));
  }

  Future _showColorDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very Important Question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
              child: const Text('Dark Red'),
              onPressed: () {
                color = const Color.fromARGB(255, 176, 0, 0);
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Dark Green'),
              onPressed: () {
                color = const Color.fromARGB(255, 1, 119, 5);
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Dark Blue'),
              onPressed: () {
                color = const Color.fromARGB(255, 0, 20, 111);
                Navigator.pop(context, color);
              },
            ),
          ],
        );
      },
    );
    setState(() {}); // Memperbarui UI setelah memilih warna
  }

}