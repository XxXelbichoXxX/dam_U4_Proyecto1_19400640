import 'package:dam_u4_proyecto1_19400640/utils/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class bitacoraA extends StatefulWidget {
  const bitacoraA({Key? key}) : super(key: key);

  @override
  State<bitacoraA> createState() => _bitacoraAState();
}

class _bitacoraAState extends State<bitacoraA> {
  final fechaEcontroller = TextEditingController();
  final eventocontroller = TextEditingController();
  final recursoscontroller = TextEditingController();
  final verificocontroller = TextEditingController();
  final fechaScontroller = TextEditingController();
  final placacontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CAPTURA BITACORA"),backgroundColor: Colors.purple,centerTitle: true,),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          TextField(
            controller: fechaEcontroller,
            decoration: (InputDecoration(
              icon: Icon(Icons.calendar_today_rounded),
              labelText: "Fecha del evento: ",
            )),
            onTap: () async{
              DateTime? fecha = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2100));
              if(fecha != null){
                setState(() {
                  fechaEcontroller.text = DateFormat('yyyy-MM-dd').format(fecha);
                });
              }
            },
          ),
          TextField(decoration: InputDecoration(labelText: "Recursos utilizados en el evento:"),
            controller: recursoscontroller,),
          TextField(decoration: InputDecoration(labelText: "¿Quien realizo la verificación?:"),
            controller: verificocontroller,),
          TextField(
            controller: fechaScontroller,
            decoration: (InputDecoration(
              icon: Icon(Icons.calendar_today_rounded),
              labelText: "Fecha del servicio: ",
            )),
            onTap: () async{
              DateTime? fecha = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2100));
              if(fecha != null){
                setState(() {
                  fechaScontroller.text = DateFormat('yyyy-MM-dd').format(fecha);
                });
              }
              },
          ),
          TextField(decoration: InputDecoration(labelText: "Placa del coche:"),
            controller: placacontroller,),
          FilledButton(onPressed: () async{ //al ser una promesa, declaramos un async para que termine hasta que se añada
            await addBitacora(DateTime.parse(fechaEcontroller.text), eventocontroller.text, recursoscontroller.text, verificocontroller.text, DateTime.parse(fechaScontroller.text), placacontroller.text).then((value) => {Navigator.pop(context)});//lo que se ejecutara al terminar el proceso
          }, child: const Text("Insertar Vehiculo"))
        ],
      ),
    );
  }
}
