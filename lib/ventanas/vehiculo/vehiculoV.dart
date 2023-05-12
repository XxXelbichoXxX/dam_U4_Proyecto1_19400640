import 'package:dam_u4_proyecto1_19400640/utils/firebase_service.dart';
import 'package:dam_u4_proyecto1_19400640/ventanas/vehiculo/vehiculoA.dart';
import 'package:dam_u4_proyecto1_19400640/ventanas/vehiculo/vehiculoE.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dam_u4_proyecto1_19400640/firebase_options.dart';

class vehiculoV extends StatefulWidget {
  const vehiculoV({Key? key}) : super(key: key);

  @override
  State<vehiculoV> createState() => _vehiculoVState();
}

class _vehiculoVState extends State<vehiculoV> {
  String searchKeyword = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DIRECTORIO DE VEHICULOS"),backgroundColor: Colors.purple,centerTitle: true, actions: [
        IconButton(onPressed: (){
          setState(() {
            searchKeyword = "";
          });
        }, icon: Icon(Icons.search))
      ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 20),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Busca por departamento',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                // Update the search keyword when the text field value changes
                setState(() {
                  searchKeyword = value;
                });
              },
            ),
          ),
        ),
      ),
        body: FutureBuilder( //utilizamos futurebuilder para construir algo hasta que retorne la información
        future: getVehiculos(searchKeyword),
        builder: (context, snapshot){ //snapshot es el resultado de la promesa
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length, //se condiciona DATA porque puede ser que no retorne nada
              itemBuilder: (context, index){
                final vehiculo = snapshot.data?[index];
                return Dismissible( // podemos desplazar los elementos a la derecha
                    onDismissed: (direction) async{
                      await deleteVehiculo(vehiculo?['uid']);
                      snapshot.data?.removeAt(index);
                    },
                    confirmDismiss: (direction) async{
                    bool result = false;
                    result = await showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: Text("¿Deseas borrar el vehiculo con placa: '${vehiculo?['placa']}' ?"),
                            actions: [
                              TextButton(onPressed: (){
                                return Navigator.pop(context, false);
                              }, child: Text("Cancelar")),
                              TextButton(onPressed: (){
                                return Navigator.pop(context, true);
                              }, child: Text("Confirmar"))
                            ],
                      );
                    });
                    return result;
                  },
                  background: Container(
                    color: Colors.deepPurple,
                    child: const Icon(Icons.delete_forever, color: Colors.white,),
                  ),
                  direction: DismissDirection.startToEnd,
                  key: Key(vehiculo?['uid']),
                  child: Card(
                    elevation: 5,
                    color: Colors.deepPurple[50],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    child: Container(
                      child: Center(
                        child:Padding(
                          padding: EdgeInsets.all(30),
                        child: InkWell(
                            child: Text(
                                  "Placa del vehiculo: ${vehiculo?['placa'] ?? ''}\n"
                                  "Tipo de vehiculo: ${vehiculo?['tipo'] ?? ''}\n"
                                  "Numero de serie del vehiculo: ${vehiculo?['numeroserie'] ?? ''}\n"
                                  "Tipo de combustible que usa: ${vehiculo?['combustible'] ?? ''}\n"
                                  "Cantidad de tanque en litros: ${vehiculo?['tanque'] ?? ''}\n"
                                  "Manejador frecuente: ${vehiculo?['trabajador'] ?? ''}\n"
                                  "Departamento al que pertenece: ${vehiculo?['depto'] ?? ''}\n"
                                  "Jefe de departamento responsable: ${vehiculo?['resguardadopor'] ?? ''}\n"
                          ),
                              onTap: () async {
                                await Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                      vehiculoE(vehiculo: vehiculo),),);
                                setState(() {});
                              },
                    ),
                      ),
                   ),
                    //
                    //},
                  ),
                  ),
                );
              },
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            await Navigator.push(context, MaterialPageRoute(builder: (builder)=> vehiculoA()));
            setState(() {});
          },
          child: Icon(Icons.add),backgroundColor: Colors.purple,
        )
    );
  }
}
