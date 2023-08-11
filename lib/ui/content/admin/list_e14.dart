import 'package:sistemaelectoral/domain/controller/controllere14.dart';
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
    TextEditingController search = TextEditingController();
    ControlE14 controle = Get.put(ControlE14());

    if (idex != 1) {
      actualizar();
      controle.listarE14().then(
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

    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      edgeOffset: 20,
      displacement: MediaQuery.of(context).size.height * 0.1,
      strokeWidth: 5,
      color: Colors.white,
      backgroundColor: Colors.grey,
      onRefresh: () async {
        actualizar();
        controle.listarE14().then((value) => Get.toNamed("/homePageAdmin"));
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
                      controle.consultarE14(search.text).then(
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
            controle.listaE14!.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    child: Text(
                      "No hay resultados de Mesas",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "alkreg",
                          fontSize: MediaQuery.of(context).size.width * 0.075),
                    ))
                : Expanded(
                    child: ListView.builder(
                      itemCount: controle.listaE14!.length,
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
                                        Text(controle.listaE14![index].sede,
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                fontFamily: 'alkbold')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          controle.listaE14![index].mesa,
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                              fontFamily: 'alkreg'),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          controle.listaE14![index].testigo,
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                              fontFamily: 'alkreg'),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        controle.listaE14![index].imagen.isEmpty
                                            ? FilledButton(
                                                onPressed: () {},
                                                child: const Text("Por subir"))
                                            : FilledButton(
                                                onPressed: () {},
                                                child: const Text("Ver E14"))
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
