import 'package:test/test.dart';

import '../game.dart';

void main() {
  GameCalculator game;

  setUp(() {
    game = GameCalculator();
  });

  tearDown(() {});

  test("miss all rolls, totalscore should be 0", () {
    final rolls = [
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0, specialRoll: 0),
    ];

    rolls.forEach((i) => game.roll(i));

    expect(game.score(), 0);
  });

  test("score all 1s, totalscore should be 21", () {
    final rolls = [
      Frame(1, 1),
      Frame(1, 1),
      Frame(1, 1),
      Frame(1, 1),
      Frame(1, 1),
      Frame(1, 1),
      Frame(1, 1),
      Frame(1, 1),
      Frame(1, 1),
      Frame(1, 1, specialRoll: 1),
    ];

    rolls.forEach((i) => game.roll(i));
    expect(game.score(), 20);
  });

  test("Spare followed by 3, totalscore should be 16", () {
    final rolls = [
      Frame(4, 6),
      Frame(3, 0),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0, specialRoll: 0),
    ];

    rolls.forEach((roll) => game.roll(roll));

    expect(game.score(), 16);
  });

  test("All spares, totalscore should be 150", () {
    final rolls = [
      Frame(4, 6),
      Frame(5, 5),
      Frame(5, 5),
      Frame(5, 5),
      Frame(5, 5),
      Frame(5, 5),
      Frame(5, 5),
      Frame(5, 5),
      Frame(5, 5),
      Frame(5, 5, specialRoll: 5),
    ];

    rolls.forEach((roll) => game.roll(roll));

    expect(game.score(), 150);
  });

  test("A strike followed by 5 and 1, totalscore should be 22", () {
    final rolls = [
      Frame(10, 0),
      Frame(5, 1),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0),
      Frame(0, 0, specialRoll: 0),
    ];

    rolls.forEach((roll) => game.roll(roll));

    expect(game.score(), 22);
  });

  test("All strikes, totalscore should be 300", () {
    final rolls = [
      Frame(10, 0),
      Frame(10, 0),
      Frame(10, 0),
      Frame(10, 0),
      Frame(10, 0),
      Frame(10, 0),
      Frame(10, 0),
      Frame(10, 0),
      Frame(10, 0),
      Frame(10, 10, specialRoll: 10),
    ];

    rolls.forEach((roll) => game.roll(roll));

    expect(game.score(), 300);
  });

  test("Normal game, score should be 187", () {
    final rolls = [
      Frame(10, 0),
      Frame(9, 1),
      Frame(5, 5),
      Frame(7, 2),
      Frame(10, 0),
      Frame(10, 0),
      Frame(10, 0),
      Frame(9, 0),
      Frame(8, 2),
      Frame(9, 1, specialRoll: 10),
    ];

    rolls.forEach((roll) => game.roll(roll));

    expect(game.score(), 187);
  });
}
