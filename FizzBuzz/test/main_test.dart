import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../main.dart';

void main() {
  test("Check for a Fizz", () {
    final game = FizzBuzzChecker(1, 4);

    game.checker();

    expect(game.message, "Fizz");
  });

  test("Check for a Buzz", () {
    final game = FizzBuzzChecker(1, 6);

    game.checker();

    expect(game.message, "Buzz");
  });

    test("Check for a FizzBuzz", () {
    final game = FizzBuzzChecker(1, 16);

    game.checker();

    expect(game.message, "FizzBuzz");
  });
}
