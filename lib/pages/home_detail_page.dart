import 'package:flutter/material.dart';
import 'package:pubguc/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          color: MyTheme.creamColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              Text(
                "\$${catalog.price.toString()}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: MyTheme.darkBluisColor),
              ),
              ElevatedButton(
                onPressed: (() {}),
                child: "Buy".text.make(),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    MyTheme.darkBluisColor,
                  ),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  ),
                ),
              ).wh(100, 50)
            ],
          ).p32(),
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image))
                  .h32(context),
              Expanded(
                  child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: MyTheme.creamColor,
                  child: Column(
                    children: [
                      Text(
                        catalog.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: MyTheme.darkBluisColor),
                      ),
                      Text(
                        catalog.desc,
                        style: TextStyle(
                            fontSize: 15, color: MyTheme.darkBluisColor),
                      ),
                      10.heightBox,
                    ],
                  ).py(64),
                ),
              ))
            ],
          ),
        ));
  }
}
