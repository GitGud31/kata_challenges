class Frame {
  int roll1;
  int roll2;
  int specialRoll;

  Frame(this.roll1, this.roll2, {this.specialRoll});
}

class GameCalculator {
  List<Frame> _rolls = [];

  void roll(Frame pinsDown) {
    _rolls.add(pinsDown);
  }

  int score() {
    int _totalScore = 0;

    for (int index = 0; index < _rolls.length; index++) {
      //index 1 to 9
      if (index < 9) {
        if (isStrike(index)) {
          _totalScore += 10 + _rolls[index + 1].roll1 + _rolls[index + 1].roll2;

          if (isStrike(index + 1) && (index + 1 != 8)) {
            _totalScore += (index + 2 < 9)
                ? _rolls[index + 2].roll1
                : _rolls[index + 1].specialRoll;
          }
        } else if (isSpare(index)) {
          _totalScore += 10 + _rolls[index + 1].roll1;
        } else {
          _totalScore += _rolls[index].roll1 + _rolls[index].roll2;
        }
      }
      //index 10
      else {
        //final last = _rolls.last.id - 1;
        final last = 9;

        if (isStrike(last)) {
          _totalScore += _rolls[last].roll1 +
              _rolls[last].roll2 +
              _rolls[last].specialRoll;
        } else if (isSpare(last)) {
          _totalScore += 10 + _rolls[last].specialRoll;
        } else {
          _totalScore += _rolls[last].roll1 + _rolls[last].roll2;
        }
      }
    }

    return _totalScore;
  }

  bool isStrike(int i) => _rolls[i].roll1 == 10 ? true : false;

  bool isSpare(int i) =>
      (_rolls[i].roll1 + _rolls[i].roll2 == 10 && _rolls[i].roll2 != 0)
          ? true
          : false;
}
