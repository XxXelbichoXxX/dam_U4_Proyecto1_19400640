import 'package:dam_u4_proyecto1_19400640/utils/firebase_service.dart';
import 'package:flutter/material.dart';

class vehiculoA extends StatefulWidget {
  const vehiculoA({Key? key}) : super(key: key);

  @override
  State<vehiculoA> createState() => _vehiculoAState();
}

class _vehiculoAState extends State<vehiculoA> {
  final placacontroller = TextEditingController();
  final tipocontroller = TextEditingController();
  final seriecontroller = TextEditingController();
  final combustiblecontroller = TextEditingController();
  final tanquecontroller = TextEditingController();
  final trabajadorcontroller = TextEditingController();
  final departamentocontroller = TextEditingController();
  final resguardocontroller = TextEditingController();


  List<String> Tipos = ["SELECCIONA UN TIPO DE VEHICULO",'Camion', 'Coche', 'Camioneta', 'Tractor', 'Motocicleta'];
  List<String> Combustible = ["SELECCIONA UN TIPO DE GASOLINA",'Gasolina regular', 'Diesel', 'Gasolina premiun'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CAPTURA UN COCHE"),backgroundColor: Colors.purple,centerTitle: true,),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          TextField(decoration: InputDecoration(labelText: "Placa del vehiculo:"),
            controller: placacontroller,autofocus: true,),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tipo de vehiculo:',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  alignment: Alignment.centerLeft,  // Alineación a la izquierda
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: tipocontroller.text.isNotEmpty ? tipocontroller.text : "SELECCIONA UN TIPO DE VEHICULO",
                    onChanged: (String? newValue) {
                      setState(() {
                        tipocontroller.text = newValue!;
                      });
                    },
                    items: Tipos.map((String tipo) {
                      return DropdownMenuItem<String>(
                        value: tipo,
                        child: Text(tipo),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextField(decoration: InputDecoration(labelText: "Numero de serie del vehiculo:"),
            controller: seriecontroller,),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tipo de combustible que usa: ',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  alignment: Alignment.centerLeft,  // Alineación a la izquierda
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: combustiblecontroller.text.isNotEmpty ? combustiblecontroller.text : "SELECCIONA UN TIPO DE GASOLINA",
                    onChanged: (String? newValue) {
                      setState(() {
                        combustiblecontroller.text = newValue!;
                      });
                    },
                    items: Combustible.map((String tipo) {
                      return DropdownMenuItem<String>(
                        value: tipo,
                        child: Text(tipo),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextField(decoration: InputDecoration(labelText: "Cantidad de tanque en litros:"),
            controller: tanquecontroller,),
          TextField(decoration: InputDecoration(labelText: "Manejador frecuente:"),
            controller: trabajadorcontroller,),
          TextField(decoration: InputDecoration(labelText: "Departamento al que pertenece:"),
            controller: departamentocontroller,),
          TextField(decoration: InputDecoration(labelText: "Jefe de departamento responsable:"),
            controller: resguardocontroller,),
          FilledButton(onPressed: () async{ //al ser una promesa, declaramos un async para que termine hasta que se añada
            await addVehiculo(placacontroller.text, tipocontroller.text, seriecontroller.text, combustiblecontroller.text, int.parse(tanquecontroller.text), trabajadorcontroller.text, departamentocontroller.text, resguardocontroller.text).then((value) => {Navigator.pop(context)});//lo que se ejecutara al terminar el proceso
          }, child: const Text("Insertar Vehiculo"))
        ],
      ),
    );
  }
}
