import 'package:sistemaelectoral/domain/controller/controllerMesa.dart';
import 'package:sistemaelectoral/domain/controller/controllerE14.dart';
import 'package:sistemaelectoral/ui/content/testigo/homePage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';

class ListMesas extends StatefulWidget {
  const ListMesas({super.key});

  @override
  State<ListMesas> createState() => _ListMesasState();
}

int idex = 0;

class _ListMesasState extends State<ListMesas> {
  void actualizar() {
    setState(() {
      idex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    ControlMesa controlm = Get.put(ControlMesa());
    ControlE14 controle = Get.put(ControlE14());
    TextEditingController search = TextEditingController();
    TextEditingController votos = TextEditingController();
    String? imagen64;

    Future selImage(op) async {
      XFile? selectImage;

      if (op == 1) {
        selectImage = await ImagePicker().pickImage(source: ImageSource.camera);
      } else {
        selectImage =
            await ImagePicker().pickImage(source: ImageSource.gallery);
      }

      if (selectImage == null) {
        imagen64 = null;
      } else {
        final pathImage = File(selectImage.path);
        final formaImage = (pathImage.toString()).split(".").last.split("'")[0];
        final bitImage = pathImage.readAsBytesSync();
        final base64 = base64Encode(bitImage);
        String imageFinal = "data:image/$formaImage;base64,$base64";
        imagen64 = imageFinal;
      }

      Navigator.pop(context);
    }

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
        controlm.FiltrarMesa(datoS).then((value) => Get.toNamed("/homePage"));
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
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search_rounded),
                    onPressed: () {
                      controlm.consultarMesa(search.text).then(
                            (value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const HomePageT(),
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
            controlm.listaMesa!.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    child: Text(
                      "No hay resultados",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "alkreg",
                          fontSize: MediaQuery.of(context).size.width * 0.08),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: controlm.listaMesa!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          alignment: AlignmentDirectional.center,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Column(
                            children: [
                              Card(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Direccion: ${controlm.listaMesa![index].sede}",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Número de mesa: ${controlm.listaMesa![index].numero}",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.035,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            if (controlm.listaMesa![index]
                                                    .estadoe14 ==
                                                "PENDIENTE") {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    content:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              selImage(1);
                                                            },
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.3,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.1,
                                                              child: const Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      'Camara',
                                                                    ),
                                                                  ),
                                                                  Icon(
                                                                      Icons
                                                                          .camera_alt,
                                                                      color: Colors
                                                                          .grey),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              selImage(2);
                                                            },
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.3,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.1,
                                                              child: const Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      'Galeria',
                                                                    ),
                                                                  ),
                                                                  Icon(
                                                                      Icons
                                                                          .image,
                                                                      color: Colors
                                                                          .grey)
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                              /*controle.crearE14(
                                                  controlm
                                                      .listaMesa![index].sede,
                                                  controlm
                                                      .listaMesa![index].numero,
                                                  datoC,
                                                  imagen64,
                                                  votos.text);*/
                                              Get.snackbar(
                                                  "E14",
                                                  controlm.listaMensajes![0]
                                                      .mensaje,
                                                  duration: const Duration(
                                                      seconds: 3),
                                                  icon: const Icon(Icons.info),
                                                  shouldIconPulse: true,
                                                  backgroundColor: controlm
                                                              .listaMensajes![0]
                                                              .mensaje ==
                                                          ""
                                                      ? Colors.green
                                                      : Colors.red);
                                            } else {
                                              Get.snackbar("E14",
                                                  "No se puede modificar el E14",
                                                  duration: const Duration(
                                                      seconds: 3),
                                                  icon: const Icon(Icons.info),
                                                  shouldIconPulse: true,
                                                  backgroundColor:
                                                      Colors.yellow);
                                            }
                                          },
                                          child: Text(
                                            controlm
                                                .listaMesa![index].estadoe14,
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                              color: controlm.listaMesa![index]
                                                          .estadoe14 ==
                                                      "PENDIENTE"
                                                  ? Colors.red
                                                  : Colors.green,
                                            ),
                                          ),
                                        ),
                                      ],
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
      ),
    );
  }
}
