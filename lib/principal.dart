import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:parcial4/bottom_nav.dart';
import 'package:parcial4/routes.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int index=0;
  BNavigator ?myBNB;
  @override
  void initState() {
    // TODO: implement initState
    myBNB = BNavigator(currentIndex: (i){
      setState(() {
        index = i;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Routes(index: index),
      bottomNavigationBar: myBNB,
    );
        
  }
}
