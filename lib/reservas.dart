import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:parcial4/bottom_nav.dart';
class Reservas extends StatefulWidget {
  const Reservas({super.key});

  @override
  State<Reservas> createState() => _ReservasState();
}

class _ReservasState extends State<Reservas> {
   
  // text fields' controllers
  final TextEditingController _cedulapersonaController = TextEditingController();
  final TextEditingController _apellidopersonaController = TextEditingController();
  final TextEditingController _horarioavionController = TextEditingController();
  final TextEditingController _tipovueloController = TextEditingController();
  final TextEditingController _destinoavionController = TextEditingController();
  final TextEditingController _estadoreservaController = TextEditingController();
  final TextEditingController _fechapersonaController = TextEditingController();
  final TextEditingController _nombrePersonaController = TextEditingController();
  final TextEditingController _sexoPersonaController = TextEditingController();
  

  final CollectionReference _reservados = 
      FirebaseFirestore.instance.collection('reservas');
      

//insertar reserva
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
                  controller: _cedulapersonaController,
                  decoration: const InputDecoration(
                    labelText: 'Cedula'
                  ),
                ),
                TextField(
                  controller: _nombrePersonaController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextField(
                  /*keyboardType:
                      const TextInputType.numberWithOptions(),*/
                  controller: _apellidopersonaController,
                  decoration: const InputDecoration(
                    labelText: 'Apellido',
                  ),
                ),
                TextField(
                  controller: _fechapersonaController,
                  decoration: const InputDecoration(
                    labelText: 'Fecha de nacimiento',
                  ),
                ),
                TextField(
                  controller: _sexoPersonaController,
                  decoration: const InputDecoration(
                    labelText: 'Sexo',
                  ),
                ),
                TextField(
                  controller: _horarioavionController,
                  decoration: const InputDecoration(
                    labelText: 'Horario de Salida', 
                  ),
                ),
                TextField(
                  controller: _destinoavionController,
                  decoration: const InputDecoration(
                    labelText: 'Destino'
                  ),
                ),
                TextField(
                  controller: _tipovueloController,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de vuelo'
                  ),
                ),
                TextField(
                  controller: _estadoreservaController,
                  decoration: const InputDecoration(
                    labelText: 'Estado de la reserva'
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Crear'),
                  onPressed: () async {
                    final String cedula = _cedulapersonaController.text;
                    final String nombre = _nombrePersonaController.text;
                    final String apellido = _apellidopersonaController.text;
                    final String fechaNac = _fechapersonaController.text;
                    final String sexoPersona = _sexoPersonaController.text;
                    final String horario = _horarioavionController.text;
                    final String destino = _destinoavionController.text;
                    final String tipo = _tipovueloController.text;
                    final String estado = _estadoreservaController.text;
                    if (nombre != null) {
                      await _reservados
                          .add({"Cedula": cedula, "nombre": nombre, "apellido": apellido, "fecha_nacimiento": fechaNac, "sexo": sexoPersona,"horario": horario, "destino": destino, "tipo_vuelo": tipo, "estado_reserva":estado });

                      _cedulapersonaController.text = '';
                      _nombrePersonaController.text = '';
                      _apellidopersonaController.text= '';
                      _fechapersonaController.text = '';
                      _sexoPersonaController.text = '';
                      _horarioavionController.text = '';
                      _destinoavionController.text = '';
                      _tipovueloController.text = '';
                      _estadoreservaController.text= '';
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
//actualizar poducto

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _cedulapersonaController.text = documentSnapshot['Cedula'].toString();
       _nombrePersonaController.text = documentSnapshot['nombre'].toString();
       _apellidopersonaController.text = documentSnapshot['apellido'].toString();
       _fechapersonaController.text = documentSnapshot['fecha_nacimiento'].toString();
       _sexoPersonaController.text = documentSnapshot['sexo'].toString();
       _horarioavionController.text = documentSnapshot['horario'].toString();
       _destinoavionController.text = documentSnapshot['destino'].toString();
       _tipovueloController.text = documentSnapshot['tipo_vuelo'].toString();
       _estadoreservaController.text = documentSnapshot['estado_reserva'].toString();
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
            child:
            SingleChildScrollView(
               child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _cedulapersonaController,
                  decoration: const InputDecoration(
                    labelText: 'Cedula'
                  ),
                ),
                TextField(
                  controller: _nombrePersonaController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextField(
                  /*keyboardType:
                      const TextInputType.numberWithOptions(),*/
                  controller: _apellidopersonaController,
                  decoration: const InputDecoration(
                    labelText: 'Apellido',
                  ),
                ),
                TextField(
                  controller: _fechapersonaController,
                  decoration: const InputDecoration(
                    labelText: 'Fecha de nacimiento',
                  ),
                ),
                TextField(
                  controller: _sexoPersonaController,
                  decoration: const InputDecoration(
                    labelText: 'Sexo',
                  ),
                ),
                TextField(
                  controller: _horarioavionController,
                  decoration: const InputDecoration(
                    labelText: 'Horario de Salida', 
                  ),
                ),
                TextField(
                  controller: _destinoavionController,
                  decoration: const InputDecoration(
                    labelText: 'Destino'
                  ),
                ),
                TextField(
                  controller: _tipovueloController,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de vuelo'
                  ),
                ),
                TextField(
                  controller: _estadoreservaController,
                  decoration: const InputDecoration(
                    labelText: 'Estado de la reserva'
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Actualizar'),
                  onPressed: () async {
                    final String cedula = _cedulapersonaController.text;
                    final String nombre = _nombrePersonaController.text;
                    final String apellido = _apellidopersonaController.text;
                    final String fechaNac = _fechapersonaController.text;
                    final String sexoPersona = _sexoPersonaController.text;
                    final String horario = _horarioavionController.text;
                    final String destino = _destinoavionController.text;
                    final String tipo = _tipovueloController.text;
                    final String estado = _estadoreservaController.text;
                    if (nombre != null) {
                      await _reservados
                          .add({"Cedula": cedula, "nombre": nombre, "apellido": apellido, "fecha_nacimiento": fechaNac, "sexo": sexoPersona,"horario": horario, "destino": destino, "tipo_vuelo": tipo, "estado_reserva":estado });

                      _cedulapersonaController.text = '';
                      _nombrePersonaController.text = '';
                      _apellidopersonaController.text= '';
                      _fechapersonaController.text = '';
                      _sexoPersonaController.text = '';
                      _horarioavionController.text = '';
                      _destinoavionController.text = '';
                      _tipovueloController.text = '';
                      _estadoreservaController.text= '';
                      Navigator.of(context).pop();
                    }
                  },
                ),
                   ElevatedButton(onPressed: () { Navigator.of(context).pop(); },
                child: Text("Cancelar")),
              ],
            ),
            ), 
           
          );
        });
  }

//borrar reserva
  Future<void> _delete(String productId) async {
    await _reservados.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('La reserva fue eliminada correctamente')));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
          title: const Center(child: Text('Reservas')),
        ),
        body: StreamBuilder(
          stream: _reservados.snapshots(),
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
                      title: Text("Estado de la reserva: "+documentSnapshot['estado_reserva'].toString()),
                      subtitle: Text("Nombre Completo: "+documentSnapshot['nombre'].toString()+ " " + documentSnapshot['apellido'].toString()+" "+
                      " Cedula: "+ documentSnapshot['Cedula'].toString()+" "+ " Horario: "+documentSnapshot['horario'].toString()+" Tipo de vuelo: "+documentSnapshot['tipo_vuelo'].toString()+
                      " Destino: "+documentSnapshot['destino'].toString()
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
// agregar la reserva
        floatingActionButton: FloatingActionButton(
          onPressed: () => _create(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}