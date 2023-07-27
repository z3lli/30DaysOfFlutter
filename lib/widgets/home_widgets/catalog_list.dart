import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pubguc/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../theme.dart';
import '../../pages/home_page.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.Items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.Items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => HomeDetailPage(catalog: catalog)))),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image)
          ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              catalog.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: MyTheme.darkBluisColor),
            ),
            Text(
              catalog.desc,
              style: TextStyle(fontSize: 11, color: MyTheme.darkBluisColor),
            ),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                Text(
                  "\$${catalog.price.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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
                )
              ],
            ).pOnly(right: 9)
          ],
        ))
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}
