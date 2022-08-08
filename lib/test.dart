import 'dart:io';
import 'game.dart';

void main() {
  var result = 0;
  int count = 0;
  var myList = <int>[];

  do {
    count = 0;
    stdout.write('˃ Enter a maximum number to random: ');

    var ipMaxNum = stdin.readLineSync();
    var tryIpMaxNum = int.tryParse(ipMaxNum!);

    print('╔════════════════════════════════════════');
    print('║            GUESS THE NUMBER            ');
    print('╟────────────────────────────────────────');

    if (tryIpMaxNum == null) {
      var game = Game();
      do {
        stdout.write('║ Guess the number between 1 and 100: ');
        var input = stdin.readLineSync();
        var guess = int.tryParse(input!);

        if (guess == null) {
          continue;
        }
        count += 1;
        result = game.doguess(guess);

      }while(result != 1);

    } else {
      var game = Game(maxrandom: tryIpMaxNum);
      do {
        stdout.write('║ Guess the number between 1 and $tryIpMaxNum: ');
        var input = stdin.readLineSync();
        var guess = int.tryParse(input!);

        if (guess == null) {
          continue;
        }
        result = game.doguess(guess);
        count += 1;
      }while(result != 1);
    }

    var checkYN = 0;
    if(result == 1){
      do{
        stdout.write('PLay again? (Y/N):');
        var check = stdin.readLineSync();
        if (check == 'n' || check == 'N') {
          myList.add(count);
          checkYN = 1;
        } else if (check == 'Y' || check == 'y') {
          myList.add(count);
          result = 0;
          checkYN = 1;
        }
      }while(checkYN != 1);
    }

  }while(result != 1);

  var len = myList.length;

  print('You’ve played $len games');
  for(int i = 0; i < len; i++){
    print('Game #${i+1}: ${myList[i]} guesses');
  }
}



