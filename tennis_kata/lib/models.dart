// ignore_for_file: slash_for_doc_comments

//** Tennis scoring system */
// https://en.wikipedia.org/wiki/Tennis#Scoring

/**
 * A game is won by the first player to have won at least four 
 * points in total and at least two points more than the opponent.
 * 
 * If at least three points have been scored by each player, 
 * and the scores are equal, the score is “deuce”.
 * 
 * If at least three points have been scored by each side and 
 * a player has one more point than his opponent, 
 * the score of the game is “advantage” for the player 
 * in the lead.
 * 
 * The running score of each game is described in a manner 
 * peculiar to tennis: scores from zero to three points are 
 * described as “love”, “15”, “30”, and “40” 
 * respectively.
 */
class TennisGame {
  final Player p1;
  final Player p2;

  TennisGame(this.p1, this.p2);

  bool haveWinner() {
    if (p1.score >= 4 && p1.score >= (p2.score + 2)) return true;
    if (p2.score >= 4 && p2.score >= (p1.score + 2)) return true;
    return false;
  }

  bool isDeuce() {
    if (p1.score >= 3 && p2.score >= 3 && p1.score == p2.score) return true;
    return false;
  }

  String isThereOnePlayerInAdvantage() {
    final playersAtForty = (p1.score >= 3 && p2.score >= 3);

    if (!haveWinner() && playersAtForty && p1.score > p2.score) return "p1";
    if (!haveWinner() && playersAtForty && p2.score > p1.score) return "p2";
    return "eql";
  }

  String gameScore() {
    if (isDeuce()) {
      return "Deuce";
    }

    if (isThereOnePlayerInAdvantage() == "p1") {
      return "${p1.name} is in advantage";
    } else if (isThereOnePlayerInAdvantage() == "p2") {
      return "${p2.name} is in advantage";
    }

    if (haveWinner()) {
      return p1.score > p2.score ? "${p1.name} wins!" : "${p2.name} wins!";
    }

    return displayCurrentScore();
  }

  void playerScored(Player p) => p.score++;

  String displayCurrentScore() {
    return "SCORE: ${p1.name} [${scoreFormatter(p1.score)}], ${p2.name} [${scoreFormatter(p2.score)}]";
  }

  String scoreFormatter(int score) {
    if (score == 0) {
      return "love";
    } else if (score == 1) {
      return "15";
    } else if (score == 2) {
      return "30";
    } else if (score == 3) {
      return "40";
    } else if (score == 4) {
      return "40A";
    } else {
      return "invalid score";
    }
  }
}

class Player {
  final String name;
  int score;

  Player(this.name) : score = 0;
}
