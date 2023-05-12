import 'package:dam_u4_proyecto1_19400640/utils/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dam_u4_proyecto1_19400640/firebase_options.dart';

import 'bitacoraA.dart';
import 'bitacoraE.dart';

class bitacoraV extends StatefulWidget {
  const bitacoraV({Key? key}) : super(key: key);

  @override
  State<bitacoraV> createState() => _bitacoraVState();
}

class _bitacoraVState extends State<bitacoraV> {
  String searchKeyword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("BITACORAS REALIZADAS"),backgroundColor: Colors.purple,centerTitle: true,actions: [
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
                  hintText: 'Busca por placa',
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
            future: getBitacora(searchKeyword),
            builder: (context, snapshot){ //snapshot es el resultado de la promesa
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data?.length, //se condiciona DATA porque puede ser que no retorne nada
                  itemBuilder: (context, index){
                    final bitacora = snapshot.data?[index];
                    return Container(
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
                                    "Fecha del evento: ${bitacora?['fecha'] ?? ''}\n"
                                        "Descripcion del evento: ${bitacora?['evento'] ?? ''}\n"
                                        "Recursos utilizados en el evento: ${bitacora?['recursos'] ?? ''}\n"
                                        "¿Quien realizo la verificación?: ${bitacora?['verifico'] ?? ''}\n"
                                        "Fecha de la verificación: ${bitacora?['fechaverificacion'] ?? ''}\n"
                                        "Placa del coche: ${bitacora?['placa'] ?? ''}\n"
                                ),
                                onTap: () async {
                                  await Navigator.push(context, MaterialPageRoute(
                                    builder: (context) =>
                                        bitacoraE(bitacora: bitacora),),);
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
            await Navigator.push(context, MaterialPageRoute(builder: (builder)=> bitacoraA()));
            setState(() {});
          },
          child: Icon(Icons.add),backgroundColor: Colors.purple,
        )
    );
  }
}
