import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parcial4/bottom_nav.dart';

class Aviones extends StatefulWidget {
  const Aviones({super.key});

  @override
  State<Aviones> createState() => _AvionesState();
}

class _AvionesState extends State<Aviones> {
  final CollectionReference _aviones = FirebaseFirestore.instance.collection('Avion');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text('Informacion de aviones')),
        ),
        body: StreamBuilder(
          stream: _aviones.snapshots(),
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
                      title: Text("Marca del avion: "+documentSnapshot['marca'].toString()),
                      subtitle: Text(" Estado del avion: "+documentSnapshot['estado'].toString()
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