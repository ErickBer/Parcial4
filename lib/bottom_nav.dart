import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BNavigator extends StatefulWidget {
  final Function currentIndex;
  const BNavigator({super.key, required this.currentIndex});

  @override
  State<BNavigator> createState() => _BNavigatorState();
}

class _BNavigatorState extends State<BNavigator> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int i){
        setState(() {
           index = i;
           widget.currentIndex(i);
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      iconSize: 25.0,
      selectedFontSize: 14.0,
      unselectedFontSize: 12.0,
      items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.airplanemode_active),
            label: 'Aviones'
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Clientes'
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_add),
            label: 'Reservas'
            )
      ] 
      );
  }
}
