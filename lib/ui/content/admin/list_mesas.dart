import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistemaelectoral/domain/controller/controllerMesa.dart';

class ListMesas extends StatefulWidget {
  const ListMesas({super.key});

  @override
  State<ListMesas> createState() => _ListMesasState();
}

class _ListMesasState extends State<ListMesas> {
  @override
  Widget build(BuildContext context) {
    ControlMesa controlm = Get.put(ControlMesa());
    TextEditingController search = TextEditingController();

    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      edgeOffset: 20,
      displacement: MediaQuery.of(context).size.height * 0.1,
      strokeWidth: 5,
      color: Colors.white,
      backgroundColor: Colors.grey,
      onRefresh: () async {
        controlm.listraMesa().then(
              (value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ListMesas(),
                ),
              ),
            );
      },
      child: WillPopScope(
        onWillPop: () async {
          Get.toNamed("/homePageAdmin");
          return true;
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
                        controlm.consultarMesaGeneral(search.text).then(
                              (value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const ListMesas(),
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
                        "No hay resultados de sedes",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.075),
                      ))
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
                                          Text(
                                            "Direccion de la sede: ",
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.06,
                                            ),
                                          ),
                                          Text(
                                            controlm.listaMesa![index].sede,
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
                                            "Número de la mesa: ${controlm.listaMesa![index].numero}",
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
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
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed("/homePageAdmin");
            },
            tooltip: 'Volver',
            child: const Icon(Icons.arrow_back_rounded),
          ),
        ),
      ),
    );
  }
}
