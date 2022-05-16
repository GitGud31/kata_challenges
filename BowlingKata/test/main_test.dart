import 'package:test/test.dart';

import '../game.dart';

void main() {
  GameCalculator game = GameCalculator();

  // 10,0  9,1  5,5  7,2  10,0  10,0  10,0  9,0  8,2  9,1,10

  //check for rolls of 0s
  test("miss all rolls, totalscore should be 0", () {
    final rolls = [
      Roll(1, 0, 0),
      Roll(2, 0, 0),
      Roll(4, 0, 0),
      Roll(5, 0, 0),
      Roll(6, 0, 0),
      Roll(7, 0, 0),
      Roll(8, 0, 0),
      Roll(9, 0, 0),
      Roll(10, 0, 0, specialRoll: 0),
    ];

    rolls.forEach((i) => game.roll(i));

    expect(game.score(), 0);
  });

  //check for rolls of 1s
  test("score all 1s, totalscore should be 21", () {
    final rolls = [
      Roll(1, 1, 1),
      Roll(2, 1, 1),
      Roll(3, 1, 1),
      Roll(4, 1, 1),
      Roll(5, 1, 1),
      Roll(6, 1, 1),
      Roll(7, 1, 1),
      Roll(8, 1, 1),
      Roll(9, 1, 1),
      Roll(10, 1, 1, specialRoll: 1),
    ];

    rolls.forEach((i) => game.roll(i));
    expect(game.score(), 20);
  });

  //check for spare followed by 3
  test("Spare followed by 3, totalscore should be 16", () {
    final rolls = [
      Roll(1, 4, 6),
      Roll(2, 3, 0),
      Roll(3, 0, 0),
      Roll(4, 0, 0),
      Roll(5, 0, 0),
      Roll(6, 0, 0),
      Roll(7, 0, 0),
      Roll(8, 0, 0),
      Roll(9, 0, 0),
      Roll(10, 0, 0, specialRoll: 0),
    ];

    rolls.forEach((roll) => game.roll(roll));

    expect(game.score(), 16);
  });

  //check for all spares
  test("All spares, totalscore should be 150", () {
    final rolls = [
      Roll(1, 4, 6),
      Roll(2, 5, 5),
      Roll(3, 5, 5),
      Roll(4, 5, 5),
      Roll(5, 5, 5),
      Roll(6, 5, 5),
      Roll(7, 5, 5),
      Roll(8, 5, 5),
      Roll(9, 5, 5),
      Roll(10, 5, 5, specialRoll: 5),
    ];

    rolls.forEach((roll) => game.roll(roll));

    expect(game.score(), 150);
  });

  //check for strike followed by five and one
  test("A strike followed by 5 and 1, totalscore should be 22", () {
    final rolls = [
      Roll(1, 10, 0),
      Roll(2, 5, 1),
      Roll(3, 0, 0),
      Roll(4, 0, 0),
      Roll(5, 0, 0),
      Roll(6, 0, 0),
      Roll(7, 0, 0),
      Roll(8, 0, 0),
      Roll(9, 0, 0),
      Roll(10, 0, 0, specialRoll: 0),
    ];

    rolls.forEach((roll) => game.roll(roll));

    expect(game.score(), 22);
  });

  //check for all strikes
  test("All strikes, totalscore should be 300", () {
    final rolls = [
      Roll(1, 10, 0),
      Roll(2, 10, 0),
      Roll(3, 10, 0),
      Roll(4, 10, 0),
      Roll(5, 10, 0),
      Roll(6, 10, 0),
      Roll(7, 10, 0),
      Roll(8, 10, 0),
      Roll(9, 10, 0),
      Roll(10, 10, 10, specialRoll: 10),
    ];

    rolls.forEach((roll) => game.roll(roll));

    expect(game.score(), 300);
  });
}
