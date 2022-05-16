/**
 * Write a program that prints one line for each number from 1 to 100
  For multiples of three print Fizz instead of the number
  For the multiples of five print Buzz instead of the number
  For numbers which are multiples of both three and five print FizzBuzz instead of the number
 */

void main() {
  print("fizz buzz kata");
}

class FizzBuzzChecker {
  int start;
  int end;
  String _message;

  FizzBuzzChecker(this.start, this.end) : _message = "";

  String get message => _message;

  void checker() {
    for (int i = start; i < end; i++) {
      if (i % 3 == 0) _message = "Fizz";
      if (i % 5 == 0) _message = "Buzz";
      if (i % 3 == 0 && i % 5 == 0) _message = "FizzBuzz";
    }
  }
}
