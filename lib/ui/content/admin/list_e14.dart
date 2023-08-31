import 'package:sistemaelectoral/domain/controller/controllerMesa.dart';
import 'package:sistemaelectoral/ui/content/admin/list_sedes.dart';
import 'package:sistemaelectoral/ui/content/admin/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListE14 extends StatefulWidget {
  const ListE14({super.key});

  @override
  State<ListE14> createState() => _ListE14State();
}

class _ListE14State extends State<ListE14> {
  void actualizar() {
    setState(() {
      idex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    ControlMesa controlm = Get.put(ControlMesa());

    if (idex != 1) {
      actualizar();
      controlm.listraMesaEC().then(
        (value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomePage(),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.058,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.058,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: OutlinedButton(
                    onPressed: () {
                      controlm.listraMesaEC().then(
                        (value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const HomePage(),
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      "E14 Cargados",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.025),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.058,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: OutlinedButton(
                    onPressed: () {
                      controlm.listraMesaEP().then(
                        (value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const HomePage(),
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      "E14 Por Cargar",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.025),
                    ),
                  ),
                ),
              ],
            ),
          ),
          controlm.listaMesa!.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  child: Text(
                    "No hay datos cargados aún",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width * 0.06),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: controlm.listaMesa!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        alignment: AlignmentDirectional.center,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: Column(
                          children: [
                            Card(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        child: Text(
                                          "Direccion del Puesto: ${controlm.listaMesa![index].sede}",
                                          style: TextStyle(
                                            color: controlm.listaMesa![index]
                                                        .estadoe14 ==
                                                    'CREADO'
                                                ? Colors.green
                                                : Colors.red,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.045,
                                          ),
                                        ),
                                      ),
                                      controlm.listaMesa![index].estadoe14 ==
                                              'PENDIENTE'
                                          ? Container(
                                              child: const Text(
                                                "PENDIENTE",
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            )
                                          : Container(
                                              child: TextButton(
                                                onPressed: () {
                                                  /*controlm
                                                        .cancelarTickets(
                                                            controlt
                                                                .listarTickets![
                                                                    index]
                                                                .ticketId
                                                                .toString())
                                                        .then((value) {
                                                      Get.snackbar(
                                                          "Ticket",
                                                          controlt
                                                              .listaMensajes![0]
                                                              .mensaje,
                                                          duration:
                                                              const Duration(
                                                                  seconds: 3),
                                                          icon: const Icon(
                                                              Icons.info),
                                                          shouldIconPulse: true,
                                                          backgroundColor: controlt
                                                                      .listaMensajes![
                                                                          0]
                                                                      .mensaje ==
                                                                  'Ticket Cancelado'
                                                              ? Colors.green
                                                              : Colors.red);
                                                    });
                                                    controlt
                                                        .listTicketsVig(
                                                            dato.toString())
                                                        .then((value) {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                const HomePage(),
                                                          ));
                                                    });
                                                  */
                                                },
                                                child: Text(
                                                  "VER",
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.035,
                                                  ),
                                                ),
                                              ),
                                            )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Mesa: ${controlm.listaMesa![index].numero}',
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.035,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            /*Row(
                                              children: [
                                                Text(
                                                  "${controlm.lista![index].fechaInicio}",
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.035,
                                                      fontFamily: 'alkreg'),
                                                ),
                                              ],
                                            ),*/
                                          ],
                                        ),
                                      )
                                    ],
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
    );
  }
}
