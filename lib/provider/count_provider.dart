import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier
/* here  changenotifier is used like set state 

it has global context 

you have to get value and set value

*/

{
  int _count = 30;

  int get count => _count; // get

  //function

  void setCount() {
    _count++;
    notifyListeners();//when setcounter call it will notify
  }
}
