import 'package:dam_u4_proyecto1_19400640/utils/firebase_service.dart';
import 'package:flutter/material.dart';

class vehiculoE extends StatefulWidget {
  final Map<String, dynamic>? vehiculo;
  vehiculoE({Key? key, required this.vehiculo}) : super(key: key);

  @override
  State<vehiculoE> createState() => _vehiculoEState();
}

class _vehiculoEState extends State<vehiculoE> {
  String uid = "";
  final placacontroller = TextEditingController();
  final tipocontroller = TextEditingController();
  final seriecontroller = TextEditingController();
  final combustiblecontroller = TextEditingController();
  final tanquecontroller = TextEditingController();
  final trabajadorcontroller = TextEditingController();
  final departamentocontroller = TextEditingController();
  final resguardocontroller = TextEditingController();
  @override
  void initState(){
    super.initState();
      uid=widget.vehiculo?['uid']  ?? '';
      placacontroller.text=widget.vehiculo?['placa']  ?? '';
      tipocontroller.text=widget.vehiculo?['tipo']  ?? '';
      seriecontroller.text=widget.vehiculo?['numeroserie']  ?? '';
      combustiblecontroller.text=widget.vehiculo?['combustible']  ?? '';
      tanquecontroller.text=widget.vehiculo?['tanque'].toString()  ?? 'Empty';
      trabajadorcontroller.text=widget.vehiculo?['trabajador']  ?? '';
      departamentocontroller.text=widget.vehiculo?['depto']  ?? '';
      resguardocontroller.text=widget.vehiculo?['resguardadopor']  ?? '';


  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("EDITAR VEHICULO"),backgroundColor: Colors.purple,centerTitle: true,),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          TextField(decoration: InputDecoration(labelText: "Placa"),
            controller: placacontroller,autofocus: true,),
          TextField(decoration: InputDecoration(labelText: "Tipo"),
            controller: tipocontroller,),
          TextField(decoration: InputDecoration(labelText: "Numero de serie"),
            controller: seriecontroller,),
          TextField(decoration: InputDecoration(labelText: "Combustible"),
            controller: combustiblecontroller,),
          TextField(decoration: InputDecoration(labelText: "Tanque"),
            controller: tanquecontroller,),
          TextField(decoration: InputDecoration(labelText: "Trabajador"),
            controller: trabajadorcontroller,),
          TextField(decoration: InputDecoration(labelText: "Departamento"),
            controller: departamentocontroller,),
          TextField(decoration: InputDecoration(labelText: "Resguardo"),
            controller: resguardocontroller,),
          FilledButton(onPressed: () async{ //al ser una promesa, declaramos un async para que termine hasta que se añada
            await updateVehiculo(uid, placacontroller.text, tipocontroller.text, seriecontroller.text, combustiblecontroller.text, int.parse(tanquecontroller.text), trabajadorcontroller.text, departamentocontroller.text, resguardocontroller.text).then((value) =>{Navigator.pop(context)});
          }, child: const Text("Actualizar Vehiculo"))
        ],
      ),
    );
  }
}
