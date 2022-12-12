import 'dart:convert';

import 'package:app/pages/empresa.dart';
import 'package:app/widget/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/icons.dart';
import '../constants/color.dart';
import '../model/empresa.model.dart';
import '../store/empresas.store.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color00,
        appBar: AppBarCustom(context: context),
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, empresaData) {
            if (empresaData.hasError) {
              return Text('Error Data');
            } else if (empresaData.hasData) {
              var data = empresaData.data as List<EmpresasModel>;
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              marker,
                              color: color02,
                              width: 30,
                              height: 30,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Entrega em',
                                  style: TextStyle(
                                    color: color02,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Av Prefeito guiomar lopes, 363, Cristo Rei',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: color03,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              cesta,
                              color: color02,
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 100,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: color04,
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  color: color01,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.filter_alt,
                              color: color05,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: color04,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Empresas",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: color02,
                          ),
                        ),
                        InkWell(
                          child: Text(
                            "Ver todos",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: color01,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: GridView.builder(
                        itemCount: data == null ? 0 : data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 30,
                        ),
                        scrollDirection: Axis.vertical,
                        reverse: false,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EmpresaPage(id: index),
                            ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: color04,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Image.asset(
                                    'assets/images/enterprise-image.png',
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: color06,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index].name.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      data[index].description.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: color03,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

Future<List<EmpresasModel>> ReadJsonData() async {
  final jsonData = await rootBundle.loadString("assets/data/data.json");
  final list = json.decode(jsonData) as List<dynamic>;

  return list.map((e) => EmpresasModel.fromJson(e)).toList();
}
