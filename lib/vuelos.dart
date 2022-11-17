import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parcial4/bottom_nav.dart';

class Vuelos extends StatefulWidget {
  const Vuelos({super.key});

  @override
  State<Vuelos> createState() => _VuelosState();
}

class _VuelosState extends State<Vuelos> {
  // text fields' controllers
  final TextEditingController _nombreavionController = TextEditingController();
  final TextEditingController _destinoavionController = TextEditingController();
  final TextEditingController _horarioavionController = TextEditingController();
  final TextEditingController _tipovueloController = TextEditingController();
  final TextEditingController _disponibilidadavionController = TextEditingController();



  final CollectionReference _vuelos = FirebaseFirestore.instance.collection('Vuelos');

  //insertar vuelo
  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: SingleChildScrollView(child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nombreavionController,
                  decoration: const InputDecoration(
                    labelText: 'Avion'
                  ),
                ),
                TextField(
                  controller: _destinoavionController,
                  decoration: const InputDecoration(labelText: 'Destino'),
                ),
                TextField(
                  /*keyboardType:
                      const TextInputType.numberWithOptions(),*/
                  controller: _horarioavionController,
                  decoration: const InputDecoration(
                    labelText: 'Hora de despegue',
                  ),
                ),
                TextField(
                  controller: _tipovueloController,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de vuelo',
                  ),
                ),
                TextField(
                  controller: _disponibilidadavionController,
                  decoration: const InputDecoration(
                    labelText: 'Disponibilidad',
                  ),
                ),
                ElevatedButton(
                  child: const Text('Crear'),
                  onPressed: () async {
                    final String nombreavion = _nombreavionController.text;
                    final String disponibilidad = _disponibilidadavionController.text;
                    final String horario = _horarioavionController.text;
                    final String destino = _destinoavionController.text;
                    final String tipo = _tipovueloController.text;
                    
                    if (nombreavion != null) {
                      await _vuelos
                          .add({"avion": nombreavion, "horario": horario, "destino": destino, "tipo_vuelo": tipo, "disponibilidad": disponibilidad });

                      _horarioavionController.text = '';
                      _destinoavionController.text = '';
                      _tipovueloController.text = '';
                      _nombreavionController.text= '';
                      _disponibilidadavionController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                ),
                ElevatedButton(onPressed: () { Navigator.of(context).pop(); },
                child: Text("Cancelar")),
              ],
            ),),
          );
        });
  }
// Modificar vuelo
Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
       _nombreavionController.text = documentSnapshot['avion'].toString();
       _horarioavionController.text = documentSnapshot['horario'].toString();
       _destinoavionController.text = documentSnapshot['destino'].toString();
       _tipovueloController.text = documentSnapshot['tipo_vuelo'].toString();
       _disponibilidadavionController.text = documentSnapshot['disponibilidad'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
                        padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: SingleChildScrollView(child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nombreavionController,
                  decoration: const InputDecoration(
                    labelText: 'Avion'
                  ),
                ),
                TextField(
                  controller: _destinoavionController,
                  decoration: const InputDecoration(labelText: 'Destino'),
                ),
                TextField(
                  /*keyboardType:
                      const TextInputType.numberWithOptions(),*/
                  controller: _horarioavionController,
                  decoration: const InputDecoration(
                    labelText: 'Hora de despegue',
                  ),
                ),
                TextField(
                  controller: _tipovueloController,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de vuelo',
                  ),
                ),
                TextField(
                  controller: _disponibilidadavionController,
                  decoration: const InputDecoration(
                    labelText: 'Disponibilidad',
                  ),
                ),
                ElevatedButton(
                  child: const Text('Actualizar'),
                  onPressed: () async {
                    final String nombreavion = _nombreavionController.text;
                    final String disponibilidad = _disponibilidadavionController.text;
                    final String horario = _horarioavionController.text;
                    final String destino = _destinoavionController.text;
                    final String tipo = _tipovueloController.text;
                    
                    if (nombreavion != null) {
                      await _vuelos
                          .add({"avion": nombreavion, "horario": horario, "destino": destino, "tipo_vuelo": tipo, "disponibilidad": disponibilidad });

                      _horarioavionController.text = '';
                      _destinoavionController.text = '';
                      _tipovueloController.text = '';
                      _nombreavionController.text= '';
                      _disponibilidadavionController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                ),
                ElevatedButton(onPressed: () { Navigator.of(context).pop(); },
                child: Text("Cancelar")),
              ],
            ),),
          );
        });
  }


  //borrar reserva
  Future<void> _delete(String productId) async {
    await _vuelos.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('El vuelo fue eliminado correctamente')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
          title: const Center(child: Text('Informacion de Vuelos')),
        ),
        body: StreamBuilder(
          stream: _vuelos.snapshots(),
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
                      title: Text("Marca del avion: "+documentSnapshot['avion'].toString()),
                      subtitle: Text(" Destino del avion: "+documentSnapshot['destino'].toString()+" Hora de salida: "+documentSnapshot['horario'].toString()+
                      " Tipo de vuelo: "+documentSnapshot['tipo_vuelo'].toString()+" Disponibilidad: "+documentSnapshot['disponibilidad'].toString()
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _update(documentSnapshot)),
                            IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _delete(documentSnapshot.id)),
                          ],
                        ),
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
        // agregar vuelos
        floatingActionButton: FloatingActionButton(
          onPressed: () => _create(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}