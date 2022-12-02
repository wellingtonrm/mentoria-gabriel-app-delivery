import 'package:app/widget/appBar.dart';
import 'package:app/widget/appBarEmpresa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/color.dart';

class EmpresaPage extends StatefulWidget {
  const EmpresaPage({super.key});

  @override
  State<EmpresaPage> createState() => _EmpresaPageState();
}

class _EmpresaPageState extends State<EmpresaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover),
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
                            "KFC - Fast Food Buger",
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
                                    '15% off',
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
                                    '40 A 60 MIN',
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
                          itemCount: 100,
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
                            child: Column(
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
                                      '15% DE CASHBACK',
                                      style: TextStyle(
                                        color: color05,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Frango frito",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: color02),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            "\$ 21",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: color02),
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.percent,
                                              color: color05,
                                              size: 13,
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
      ),
    );
  }
}
