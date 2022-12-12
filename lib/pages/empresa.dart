import 'dart:convert';

import 'package:app/widget/appBarEmpresa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/color.dart';
import '../model/empresa.model.dart';

class EmpresaPage extends StatelessWidget {
  final int id;
  const EmpresaPage({super.key, required this.id});

  Future<List<EmpresasModel>> ReadJsonData() async {
    final jsonData = await rootBundle.loadString("assets/data/data.json");
    final list = jsonDecode(jsonData) as List<dynamic>;

    //print(list);

    return list.map((e) => EmpresasModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, empresaProdutos) {
            if (empresaProdutos.hasError) {
              return Center(
                child: Text('Error Data'),
              );
            } else if (empresaProdutos.hasData) {
              var data = empresaProdutos.data as List<EmpresasModel>;
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    AppBarEmpresa(context: context),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 100),
                        decoration: BoxDecoration(
                          color: color00,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(top: 20, left: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[id].name.toString(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: color01,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.percent,
                                            color: color01,
                                            size: 13,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            data[id].discount.toString() +
                                                '% off',
                                            style: TextStyle(
                                              color: color01,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.schedule,
                                            color: color05,
                                            size: 13,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            data[id].waitingTime.toString(),
                                            style: TextStyle(
                                              color: color05,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(left: 30),
                              margin: EdgeInsets.only(top: 30),
                              child: Text(
                                "Produtos",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: color02),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                height: MediaQuery.of(context).size.height,
                                child: GridView.builder(
                                  itemCount: data[id].products == null
                                      ? 0
                                      : data[id].products?.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 4,
                                    crossAxisSpacing: 30,
                                    mainAxisSpacing: 30,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  reverse: false,
                                  itemBuilder: (context, index) => Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: color04,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.percent,
                                                  color: color05,
                                                  size: 13,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  data[id]
                                                          .products![index]
                                                          .cashback
                                                          .toString() +
                                                      '% DE CASHBACK',
                                                  style: TextStyle(
                                                    color: color05,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              data[id]
                                                  .products![index]
                                                  .name
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: color02),
                                            ),
                                            Text(
                                              data[id]
                                                  .products![index]
                                                  .description
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                  color: color03),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "\$" +
                                                        data[id]
                                                            .products![index]
                                                            .price
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: color02),
                                                  ),
                                                  SizedBox(width: 10),
                                                  SizedBox(
                                                    height: 30,
                                                    width: 30,
                                                    child: TextButton(
                                                      child: Icon(
                                                        Icons.add,
                                                        color: color00,
                                                        size: 13,
                                                      ),
                                                      onPressed: () {},
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(color01),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      //
    );
  }
}
