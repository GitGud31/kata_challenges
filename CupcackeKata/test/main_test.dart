import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../main.dart';

void main() {
  group("names", () {
    group("initializations", () {
      Product _cake;
      test("Initialize Cupcake", () {
        _cake = Cupcake();
        expect(_cake.name(), "🧁");
      });

      test("Initialize Cookie", () {
        _cake = Cookie();
        expect(_cake.name(), Cookie.cookie);
      });
    });

    group("Cake with Nuts only", () {
      test("Cupcake with nuts", () {
        final _cakeWithTopping = Nut(Cupcake());
        expect(_cakeWithTopping.name(), "🧁 with 🥜");
      });

      test("Cookie with chocolate", () {
        final _cakeWithTopping = Chocolate(Cookie());
        expect(_cakeWithTopping.name(), "🍪 with 🍫");
      });
    });

    group("Cake with Chocolate only", () {
      test("Cupcake with chocolate", () {
        final _cakeWithTopping = Chocolate(Cupcake());
        expect(_cakeWithTopping.name(), "🧁 with 🍫");
      });

      test("Cookie with chocolate", () {
        final _cakeWithTopping = Chocolate(Cookie());
        expect(_cakeWithTopping.name(), "🍪 with 🍫");
      });
    });

    group("Cake with multiple toppins", () {
      test("Cupcake with nuts and chocolate", () {
        final _cupcakeWithNutsAndChocolate = Chocolate(Nut(Cupcake()));

        expect(_cupcakeWithNutsAndChocolate.name(), "🧁 with 🥜 and 🍫");
      });

      test("Cupcake with chocolate and nuts", () {
        final _cupcakeWithChocolateAndNuts = Nut(Chocolate(Cupcake()));

        expect(_cupcakeWithChocolateAndNuts.name(), "🧁 with 🍫 and 🥜");
      });

      test("Cookie with nuts and chocolate", () {
        final _cookieWithNutsAndChocolate = Chocolate(Nut(Cookie()));

        expect(_cookieWithNutsAndChocolate.name(), "🍪 with 🥜 and 🍫");
      });

      test("Cookie with chocolate and nuts", () {
        final _cookieWithChocolateAndNuts = Nut(Chocolate(Cookie()));

        expect(_cookieWithChocolateAndNuts.name(), "🍪 with 🍫 and 🥜");
      });
    });
  });

  group("prices", () {
    test("Price of a cupcake", () {
      final _cupcake = Cupcake();

      expect(_cupcake.price(), 1.0);
    });

    test("Price of a cookie", () {
      final _cookie = Cookie();

      expect(_cookie.price(), 2.0);
    });

    test("Price of cupcake with nuts", () {
      final _cupcakeWithNuts = Nut(Cupcake());

      expect(_cupcakeWithNuts.price(), 1.2);
    });

    test("Price of cupcake with chocolate", () {
      final _cupcakeWithChocolate = Chocolate(Cupcake());

      expect(_cupcakeWithChocolate.price(), 1.1);
    });

    test("Price of coockie with nuts", () {
      final _cookieWithNuts = Nut(Cookie());

      expect(_cookieWithNuts.price(), 2.2);
    });

    test("Price of coockie with chocolate", () {
      final _cookieWithChocolate = Chocolate(Cookie());

      expect(_cookieWithChocolate.price(), 2.1);
    });

    test("Price of a cupcake with nuts and chocolate", () {
      final _cake = Chocolate(Nut(Cupcake()));

      expect(_cake.price(), 1.3);
    });

    test("Price of a cookie with nuts and chocolate", () {
      final _cake = Chocolate(Nut(Cookie()));

      expect(double.parse(_cake.price().toStringAsFixed(1)), 2.3);
    });
  });
}
