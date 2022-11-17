import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parcial4/bottom_nav.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  State<Clientes> createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  final CollectionReference _clientes = FirebaseFirestore.instance.collection('Clientes');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
          title: const Center(child: Text('Informacion de Clientes')),
        ),
        body: StreamBuilder(
          stream: _clientes.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text("Codigo Reserva: "+documentSnapshot['reserva'].toString()),
                      subtitle: Text(" Nombre completo: "+documentSnapshot['nombre'].toString()+" "+documentSnapshot['apellido'].toString()+" Sexo: "+documentSnapshot['sexo'].toString()+" Nombre de usuario: "+documentSnapshot['usuario'].toString()+" Tipo: "+documentSnapshot['tipo'].toString()
                      ),

                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
    );
  }
}