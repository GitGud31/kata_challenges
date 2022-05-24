//** Kata Problem description
//
//https://codingdojo.org/kata/cupcake/ */

void main() {
  print("cupcacke kata");
}

//Data source
abstract class Cake {
  String name();
  double price();
}

//Decorator Data Source
class Topping implements Cake {
  final Cake cake;

  Topping(this.cake);

  @override
  String name() {
    return cake.name() + " " + withTopping() + " ";
  }

  String withTopping() {
    return cake.name().contains("with") ? "and" : "with";
  }

  @override
  double price() => cake.price();
}

//Decorator
class Cupcake implements Cake {
  static final cupcake = "🧁";

  Cupcake();

  @override
  String name() => cupcake;

  @override
  double price() => 1.0;
}

//Decorator
class Cookie implements Cake {
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

  Nut(Cake cake) : super(cake);

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

  Chocolate(Cake cake) : super(cake);

  @override
  String name() {
    return super.name() + chocolate;
  }

  @override
  double price() => super.price() + 0.1;
}
