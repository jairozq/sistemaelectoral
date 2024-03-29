import 'package:sistemaelectoral/domain/controller/controllerMesa.dart';
import 'package:sistemaelectoral/domain/controller/controllerSede.dart';
import 'package:sistemaelectoral/ui/content/admin/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListSedes extends StatefulWidget {
  const ListSedes({super.key});

  @override
  State<ListSedes> createState() => _ListSedesState();
}

cargarDatos() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  dato = pref.getString("idG").toString();
}

int idex = 0;

class _ListSedesState extends State<ListSedes> {
  void actualizar() {
    setState(() {
      idex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    ControlSede controls = Get.put(ControlSede());
    ControlMesa controlm = Get.put(ControlMesa());
    actualizar();

    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      edgeOffset: 20,
      displacement: MediaQuery.of(context).size.height * 0.1,
      strokeWidth: 5,
      color: Colors.white,
      backgroundColor: Colors.grey,
      onRefresh: () async {
        actualizar();
        controls
            .listarSedeGeneral()
            .then((value) => Get.toNamed("/homePageAdmin"));
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 2, bottom: 10),
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.05,
              child: TextField(
                controller: search,
                maxLines: 1,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search_rounded),
                    onPressed: () {
                      controls.consultarSede(search.text).then(
                            (value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const HomePage(),
                              ),
                            ),
                          );
                    },
                  ),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: 'Buscar...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            controls.listaSede!.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    child: Text(
                      "No hay resultados de sedes",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width * 0.075),
                    ))
                : Expanded(
                    child: ListView.builder(
                      itemCount: controls.listaSede!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          alignment: AlignmentDirectional.center,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Column(
                            children: [
                              Card(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Nombre: ${controls.listaSede![index].nombre}",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Direccion: ${controls.listaSede![index].direccion}",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Número de mesas: ${controls.listaSede![index].mesas}",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                          ),
                                        ),
                                      ],
                                    ),
                                    controls.listaSede![index].estadomesas ==
                                            "CREADAS"
                                        ? Container(
                                            child: FilledButton(
                                              onPressed: () {
                                                print("boton creadas");
                                                Get.snackbar('Mesas',
                                                    'Ya se encuentran creadas las mesas en ${controls.listaSede![index].nombre}',
                                                    duration: const Duration(
                                                        seconds: 3),
                                                    icon:
                                                        const Icon(Icons.info),
                                                    shouldIconPulse: true,
                                                    backgroundColor:
                                                        Colors.yellow);
                                              },
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Crear Mesas",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.03,
                                                    ),
                                                  ),
                                                  Text(
                                                    "creadas",
                                                    style: TextStyle(
                                                      color: Colors.green[900],
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.015,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container(
                                            child: FilledButton(
                                              onPressed: () {
                                                controlm
                                                    .crearMesa(
                                                        controls
                                                            .listaSede![index]
                                                            .mesas,
                                                        controls
                                                            .listaSede![index]
                                                            .direccion)
                                                    .then(
                                                  (value) {
                                                    if (controlm
                                                            .listaMensajes![0]
                                                            .mensaje ==
                                                        "Las mesas han sido adicionadas: ${controls.listaSede![index].mesas}") {
                                                      controls
                                                          .actualizarSedeEstado(
                                                              controls
                                                                  .listaSede![
                                                                      index]
                                                                  .direccion)
                                                          .then(
                                                        (value) {
                                                          Get.snackbar(
                                                            'Puestos',
                                                            controls
                                                                .listaMensajes![
                                                                    0]
                                                                .mensaje,
                                                            duration:
                                                                const Duration(
                                                                    seconds: 3),
                                                            icon: const Icon(
                                                                Icons.info),
                                                            shouldIconPulse:
                                                                true,
                                                            backgroundColor: controls
                                                                        .listaMensajes![
                                                                            0]
                                                                        .mensaje ==
                                                                    'Se ha modificado el estado de la sede'
                                                                ? Colors.green
                                                                : Colors.red,
                                                          );
                                                        },
                                                      );
                                                      Get.snackbar(
                                                        'Mesas',
                                                        controlm
                                                            .listaMensajes![0]
                                                            .mensaje,
                                                        duration:
                                                            const Duration(
                                                                seconds: 3),
                                                        icon: const Icon(
                                                            Icons.info),
                                                        shouldIconPulse: true,
                                                        backgroundColor: controlm
                                                                    .listaMensajes![
                                                                        0]
                                                                    .mensaje ==
                                                                'Las mesas han sido adicionadas: ${controls.listaSede![index].mesas}'
                                                            ? Colors.green
                                                            : Colors.red,
                                                      );
                                                      controls
                                                          .listarSedeGeneral()
                                                          .then(
                                                        (value) {
                                                          Get.toNamed(
                                                              "/homePageAdmin");
                                                        },
                                                      );
                                                    } else {
                                                      Get.snackbar(
                                                        'Mesas',
                                                        controlm
                                                            .listaMensajes![0]
                                                            .mensaje,
                                                        duration:
                                                            const Duration(
                                                                seconds: 3),
                                                        icon: const Icon(
                                                            Icons.info),
                                                        shouldIconPulse: true,
                                                        backgroundColor:
                                                            Colors.red,
                                                      );
                                                    }
                                                  },
                                                );
                                              },
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Crear Mesas",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.03,
                                                    ),
                                                  ),
                                                  Text(
                                                    "pendientes",
                                                    style: TextStyle(
                                                      color: Colors.red[900],
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.015,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.003,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
