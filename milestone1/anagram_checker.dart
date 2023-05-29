import 'dart:io';

void main(List<String> args) {

  print("Enter First String : ");
  String a=stdin.readLineSync()!;
  print("Enter Second String");
  String b=stdin.readLineSync()!;
  var twostrings=[a,b];
    if(twostrings[0].length!=twostrings[1].length)
      print(false);
    else if(twostrings[0].trim()==twostrings[1].trim())
      print(true);
    else
    {
      var firstString=Map();
      var secondString=Map();

      twostrings[0].split('').forEach((element) {
        firstString[element]=firstString[element]==null?1:firstString[element]+1;
      });
       twostrings[1].split('').forEach((element) {
        secondString[element]=secondString[element]==null?1:secondString[element]+1;
      });
      if(mapEquals(firstString,secondString))
        print(true);
      else
        print(false);
    }
}

bool mapEquals(Map firstString, Map secondString) {
  for(var key in firstString.keys)
  {
    if(!(secondString.containsKey(key) && secondString[key]==firstString[key]))
    {
      return false;
    }
  }
  return true;
}