import 'package:dam_u4_proyecto1_19400640/utils/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class bitacoraE extends StatefulWidget {
  final Map<String, dynamic>? bitacora;
  bitacoraE({Key? key, required this.bitacora}) : super(key: key);

  @override
  State<bitacoraE> createState() => _bitacoraEState();
}

class _bitacoraEState extends State<bitacoraE> {
  String uid = "";
  final fechaEcontroller = TextEditingController();
  final eventocontroller = TextEditingController();
  final recursoscontroller = TextEditingController();
  final verificocontroller = TextEditingController();
  final fechaScontroller = TextEditingController();
  final placacontroller = TextEditingController();

  @override
  void initState(){
    super.initState();
    uid=widget.bitacora?['uid']  ?? '';
    placacontroller.text=widget.bitacora?['placa']  ?? '';
    fechaEcontroller.text=widget.bitacora?['fecha']  ?? '';
    eventocontroller.text=widget.bitacora?['evento']  ?? '';
    recursoscontroller.text=widget.bitacora?['recursos']  ?? '';
    verificocontroller.text=widget.bitacora?['verifico']  ?? '';
    fechaScontroller.text=widget.bitacora?['fechaverificacion']  ?? '';



  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("EDITAR BITACORA"),backgroundColor: Colors.purple,centerTitle: true,),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
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
          FilledButton(onPressed: () async{ //al ser una promesa, declaramos un async para que termine hasta que se añada
            await updateBitacora(uid, DateTime.parse(fechaEcontroller.text), eventocontroller.text, recursoscontroller.text, verificocontroller.text, DateTime.parse(fechaScontroller.text), placacontroller.text).then((value) => {Navigator.pop(context)});//lo que se ejecutara al terminar el proceso
          }, child: const Text("Insertar Vehiculo"))
        ],
      ),
    );
  }
}


