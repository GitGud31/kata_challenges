import 'package:tennis_kata/models.dart';
import 'package:test/test.dart';

void main() {
  late final TennisGame game;
  late final Player p1;
  late final Player p2;

  setUp(() {
    p1 = Player("Player1");
    p2 = Player("Player2");
    game = TennisGame(p1, p2);
  });

  tearDown(() {});

  test("init states", () {
    expect(game.p1.score, equals(0));
    expect(game.p2.score, equals(0));
    expect(game.gameScore(), "SCORE: Player1 [love], Player2 [love]");
  });

  test("Player1 scores", () {
    game.playerScored(p1);

    expect(game.p1.score, equals(1));
    expect(game.p2.score, equals(0));
    expect(game.gameScore(), "SCORE: Player1 [15], Player2 [love]");
  });

  test("Player2 scores twice", () {
    game.playerScored(p2);
    game.playerScored(p2);

    expect(game.p1.score, equals(0));
    expect(game.p2.score, equals(2));

    expect(game.gameScore(), "SCORE: Player1 [love], Player2 [30]");
  });

  test("Game state is deuce", () {
    //p1
    game.playerScored(p1);
    game.playerScored(p1);
    game.playerScored(p1);

    //p2
    game.playerScored(p2);
    game.playerScored(p2);
    game.playerScored(p2);

    expect(game.p1.score, equals(3));
    expect(game.p2.score, equals(3));

    expect(game.gameScore(), "Deuce");
  });

  test("Player1 is in advantage, Player2 has 15", () {
    //p1
    game.playerScored(p1);
    game.playerScored(p1);
    game.playerScored(p1);

    //p2
    game.playerScored(p2);

    expect(game.p1.score, equals(3));
    expect(game.p2.score, equals(1));

    expect(game.displayCurrentScore(), "SCORE: Player1 [40], Player2 [15]");
    expect(game.gameScore(), "Player1 is in advantage");
  });

    test("Player2 wins, Player1 has 15", () {
    //p1
    game.playerScored(p1);

    //p2
    game.playerScored(p2);
    game.playerScored(p2);
    game.playerScored(p2);
    game.playerScored(p2);

    expect(game.p1.score, equals(1));
    expect(game.p2.score, equals(4));

    expect(game.gameScore(), "Player2 wins!");
  });
}
