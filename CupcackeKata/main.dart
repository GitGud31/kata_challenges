//** Kata Problem description
//
//https://codingdojo.org/kata/cupcake/ */

void main() {
  print("cupcacke kata");
}

//Data source
abstract class Product {
  String name();
  double price();
}

//Decorator Data Source
class Topping implements Product {
  final Product product;

  Topping(this.product);

  @override
  String name() {
    return product.name() + " " + withTopping() + " ";
  }

  String withTopping() {
    return product.name().contains("with") ? "and" : "with";
  }

  @override
  double price() => product.price();
}

//Decorator
class Cupcake implements Product {
  static final cupcake = "🧁";

  Cupcake();

  @override
  String name() => cupcake;

  @override
  double price() => 1.0;
}

//Decorator
class Cookie implements Product {
  static final cookie = "🍪";

  Cookie();

  @override
  String name() => cookie;

  @override
  double price() => 2.0;
}

//Decorator
class Nut extends Topping {
  static final nuts = "🥜";

  Nut(Product Product) : super(Product);

  @override
  String name() {
    return super.name() + nuts;
  }

  @override
  double price() => super.price() + 0.2;
}

//Decorator
class Chocolate extends Topping {
  static final chocolate = "🍫";

  Chocolate(Product Product) : super(Product);

  @override
  String name() {
    return super.name() + chocolate;
  }

  @override
  double price() => super.price() + 0.1;
}
