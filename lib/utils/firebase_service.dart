import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//obtener vehiculos
Future<List> getVehiculos(String campo) async {
  List vehiculos = [];
  CollectionReference collectionReferenceVehiculo = db.collection('vehiculo');
  if(campo.isNotEmpty){
    QuerySnapshot queryVehiculo = await collectionReferenceVehiculo.where('depto',isEqualTo: campo).get();
    for(var doc in queryVehiculo.docs) {
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      final vehiculo = {
        "uid": doc.id,
        "placa": data['placa'],
        "tipo": data['tipo'],
        "numeroserie": data['numeroserie'],
        "combustible": data['combustible'],
        "tanque": data['tanque'],
        "trabajador": data['trabajador'],
        "depto": data['depto'],
        "resguardadopor": data['resguardadopor']
      };
      vehiculos.add(vehiculo);
    }
    await Future.delayed(const Duration(seconds: 1));

    return vehiculos;
  }else{
    QuerySnapshot queryVehiculo = await collectionReferenceVehiculo.get();
    for(var doc in queryVehiculo.docs){
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      final vehiculo = {
        "uid" : doc.id,
        "placa" : data['placa'],
        "tipo" : data['tipo'],
        "numeroserie" : data['numeroserie'],
        "combustible" : data['combustible'],
        "tanque" : data['tanque'],
        "trabajador" : data['trabajador'],
        "depto" : data['depto'],
        "resguardadopor" : data['resguardadopor']
      };
      vehiculos.add(vehiculo);
  }
    await Future.delayed(const Duration(seconds: 1));

    return vehiculos;

  };

}

//cargar vehiculo

Future<void> addVehiculo(String placa, String tipo, String numeroserie, String combustible, int tanque, String trabajador, String depto, String resguardadopor) async{ //asincrono proque tenemos que esperar hasta que se guarde para terminar el proceso
  await db.collection("vehiculo").add(
      {"placa": placa,
        "tipo" : tipo,
        "numeroserie" : numeroserie,
        "combustible" : combustible,
        "tanque" : tanque,
        "trabajador" : trabajador,
        "depto" : depto,
        "resguardadopor" : resguardadopor
      }); //son llaves porque es un json
}

//editar Vehiculo
Future<void> updateVehiculo(String uid, String placa, String tipo, String numeroserie, String combustible, int tanque, String trabajador, String depto, String resguardadopor) async{
  await db.collection('vehiculo').doc(uid).set(
      {"placa": placa,
        "tipo" : tipo,
        "numeroserie" : numeroserie,
        "combustible" : combustible,
        "tanque" : tanque,
        "trabajador" : trabajador,
        "depto" : depto,
        "resguardadopor" : resguardadopor});
}

//Eliminar vehiculo
Future<void> deleteVehiculo(String uid) async{
  await db.collection('vehiculo').doc(uid).delete();
}

//obtener Bitacora
Future<List> getBitacora(String campo) async {
  List bitacoras = [];
  CollectionReference collectionReferenceBitacora = db.collection('bitacora');
  if(campo.isNotEmpty){
    QuerySnapshot queryBitacora = await collectionReferenceBitacora.where('placa',isEqualTo: campo).get();
    for(var doc in queryBitacora.docs){
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      final bitacora = {
        "uid" : doc.id,
        "fecha": DateFormat('yyyy-MM-dd').format(data["fecha"].toDate()).toString(),
        "evento" : data['evento'],
        "recursos" : data['recursos'],
        "verifico" : data['verifico'],
        "fechaverificacion": DateFormat('yyyy-MM-dd').format(data["fechaverificacion"].toDate()).toString(),
        "placa" : data['placa'],
      };
      bitacoras.add(bitacora);
    };
    await Future.delayed(const Duration(seconds: 1));

    return bitacoras;
  }else{
    QuerySnapshot queryBitacora = await collectionReferenceBitacora.get();
    for(var doc in queryBitacora.docs){
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      final bitacora = {
        "uid" : doc.id,
        "fecha": DateFormat('yyyy-MM-dd').format(data["fecha"].toDate()).toString(),
        "evento" : data['evento'],
        "recursos" : data['recursos'],
        "verifico" : data['verifico'],
        "fechaverificacion": DateFormat('yyyy-MM-dd').format(data["fechaverificacion"].toDate()).toString(),
        "placa" : data['placa'],
      };
      bitacoras.add(bitacora);
    };
    await Future.delayed(const Duration(seconds: 1));

    return bitacoras;
  }



}

//cargar Bitacora

Future<void> addBitacora(DateTime fecha, String evento, String recursos, String verifico, DateTime fechaverificacion, String placa) async{ //asincrono proque tenemos que esperar hasta que se guarde para terminar el proceso
  await db.collection("bitacora").add(
      {"fecha": fecha,
        "evento" : evento,
        "recursos" : recursos,
        "verifico" : verifico,
        "fechaverificacion" : fechaverificacion,
        "placa" : placa,
      }); //son llaves porque es un json
}

//editar Vehiculo
Future<void> updateBitacora(String uid, DateTime fecha, String evento, String recursos, String verifico, DateTime fechaverificacion, String placa) async{
  await db.collection('bitacora').doc(uid).set(
      {
        "fecha": fecha,
      "evento" : evento,
        "recursos" : recursos,
        "verifico" : verifico,
        "fechaverificacion" : fechaverificacion,
        "placa" : placa,
      });
}

//Eliminar vehiculo
Future<void> deleteBitacora(String uid) async{
  await db.collection('bitacora').doc(uid).delete();
}