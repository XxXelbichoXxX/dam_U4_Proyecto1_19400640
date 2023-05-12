import 'package:dam_u4_proyecto1_19400640/ventanas/bitacora/bitacoraV.dart';
import 'package:dam_u4_proyecto1_19400640/ventanas/vehiculo/vehiculoV.dart';
import 'package:flutter/material.dart';

class inicio extends StatefulWidget {
  const inicio({Key? key}) : super(key: key);

  @override
  State<inicio> createState() => _inicioState();
}

class _inicioState extends State<inicio> {
  int _indice = 0;

  void _cambiarIndice(int indice){
    setState(() {
      _indice = indice;
    });
  }

  final List<Widget> _paginas = [
    vehiculoV(),
    bitacoraV(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu de inicio"), centerTitle: true, backgroundColor: Colors.amber, foregroundColor: Colors.black,
      ),
      body: _paginas[_indice],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.car_rental),label: "Vehiculos"),
          BottomNavigationBarItem(icon: Icon(Icons.book),label: "Bitacora"),
        ],
        currentIndex: _indice,
        backgroundColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.purple,
        onTap: _cambiarIndice,
      ),
    );
  }
}
