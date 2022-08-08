import 'dart:math';
class Game{
  int? _answer;
  int count = 0;

  Game({int maxrandom = 100}){
    var r = Random();
    _answer = r.nextInt(maxrandom) + 1;
    print("║ คำตอบ $_answer");
  }

  int doguess(int num){
    if(num == _answer){
      count += 1;
      print('║ ➜ $num is CORRECT ❤, total guesses: $count');
      print('╟────────────────────────────────────────');
      print('║                 THE END                ');
      print('╚════════════════════════════════════════');
      return 1;
    }else if(num > _answer!){
      count += 1;
      print('║ ➜ $num is TOO HIGH! ▲');
      print('╟────────────────────────────────────────');
      return 0;
    }else{
      count += 1;
      print('║ ➜ $num is TOO LOW! ▼');
      print('╟────────────────────────────────────────');
      return 0;
    }
  }
}