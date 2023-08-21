import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistemaelectoral/domain/controller/controllerTestigo.dart';

class ListTestigos extends StatefulWidget {
  const ListTestigos({super.key});

  @override
  State<ListTestigos> createState() => _ListTestigosState();
}

class _ListTestigosState extends State<ListTestigos> {
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    ControlTestigo controlt = Get.put(ControlTestigo());

    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      edgeOffset: 20,
      displacement: MediaQuery.of(context).size.height * 0.1,
      strokeWidth: 5,
      color: Colors.white,
      backgroundColor: Colors.grey,
      onRefresh: () async {
        controlt.listarTestigo().then(
              (value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ListTestigos(),
                ),
              ),
            );
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, bottom: 10),
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
                      controlt.consultarTestigo(search.text).then(
                            (value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ListTestigos(),
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
            controlt.listaTestigo!.isEmpty
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
                      itemCount: controlt.listaTestigo!.length,
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
                                          "Usuario: ${controlt.listaTestigo![index].user}",
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
                                          "Cedula: ${controlt.listaTestigo![index].cedula}",
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
                                          "Puesto de votacion: ${controlt.listaTestigo![index].sede}",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                          ),
                                        ),
                                      ],
                                    ),
                                    controlt.listaTestigo![index].estado ==
                                            "Activo"
                                        ? TextButton(
                                            onPressed: () {
                                              controlt
                                                  .modificarEstadoTestigo(
                                                      controlt
                                                          .listaTestigo![index]
                                                          .cedula,
                                                      "Inactivo")
                                                  .then(
                                                    (value) {},
                                                  );
                                              Get.snackbar(
                                                'Usuarios',
                                                controlt.mensaje![0].mensaje,
                                                duration:
                                                    const Duration(seconds: 3),
                                                icon: const Icon(Icons.info),
                                                shouldIconPulse: true,
                                                backgroundColor: controlt
                                                            .mensaje![0]
                                                            .mensaje ==
                                                        'Estado del usuario modificado'
                                                    ? Colors.green
                                                    : Colors.red,
                                              );
                                              controlt.listarTestigo().then(
                                                (value) {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          const ListTestigos(),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Text(
                                              "Activo",
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04,
                                                color: Colors.green,
                                              ),
                                            ),
                                          )
                                        : TextButton(
                                            onPressed: () {
                                              controlt
                                                  .modificarEstadoTestigo(
                                                      controlt
                                                          .listaTestigo![index]
                                                          .cedula,
                                                      "Activo")
                                                  .then(
                                                    (value) {},
                                                  );
                                              Get.snackbar('Usuarios',
                                                  controlt.mensaje![0].mensaje,
                                                  duration: const Duration(
                                                      seconds: 3),
                                                  icon: const Icon(Icons.info),
                                                  shouldIconPulse: true,
                                                  backgroundColor: controlt
                                                              .mensaje![0]
                                                              .mensaje ==
                                                          'Estado del usuario modificado'
                                                      ? Colors.green
                                                      : Colors.red);
                                              controlt.listarTestigo().then(
                                                (value) {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          const ListTestigos(),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Text(
                                              "Inactivo",
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed("/homePageAdmin");
          },
          tooltip: 'Volver',
          child: const Icon(Icons.arrow_back_rounded),
        ),
      ),
    );
  }
}
