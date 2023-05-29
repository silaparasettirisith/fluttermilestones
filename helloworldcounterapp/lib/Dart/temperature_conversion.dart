import 'dart:io';
void main(List<String> args) {
  print("Enter a temperature value: ");
  int value=int.parse(stdin.readLineSync()!);
  print("Choose conversion type (1 for Celsius to Fahrenheit, 2 for Fahrenheit to Celsius): ");
  int conversionvalue=int.parse(stdin.readLineSync()!);
  var dotsymbol='\u00b0';
  switch (conversionvalue) {
    case 1:
      var f = (value * 9/5) + 32;
      print(f.toString()+dotsymbol+"F"); 
      break;
    case 2:
      var c = (value - 32) * 5/9;
      print(c.toString()+dotsymbol+"C"); 
      break;
    default:
      print("Invalid Input");
  }
}