import 'package:parcial4/aviones.dart';
import 'package:parcial4/principal.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Parcial4());
}

class Parcial4 extends StatelessWidget {
  const Parcial4({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reservas de vuelo',
      home: Principal(),
    );
  }
}
