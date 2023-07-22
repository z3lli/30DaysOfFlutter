class CatalogModel {
  static final Items = [
    Item(
        id: 1,
        name: "iPhone14",
        desc: "Pro Max",
        price: 999,
        color: "black",
        image:
            "https://i0.wp.com/www.androidsage.com/wp-content/uploads/2022/09/iPhone-14-Pro-and-Pro-Max-3.jpg?resize=1600%2C895&quality=100&ssl=1")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
