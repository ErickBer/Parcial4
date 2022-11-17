import 'package:flutter/material.dart';
import 'package:parcial4/aviones.dart';
import 'package:parcial4/clientes.dart';
import 'package:parcial4/principal.dart';
import 'package:parcial4/reservas.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      Aviones(),
      const Clientes(),
      Reservas()
    ];
    return myList[index];
  }
}