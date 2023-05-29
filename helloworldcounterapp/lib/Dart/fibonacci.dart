import 'dart:io';

void main(List<String> args) {
  print("Enter the value");
  int n=int.parse(stdin.readLineSync()!);

  var l=[];
  l.add(0);
  l.add(1);
  if(n<=2)
  {
    if(n==1)
      print(0);
    else
      print(1);
  }
  else
  {
  for(int i=2;i<n;i++)
    l.add(l[i-1]+l[i-2]);
  print("The Fibonacci Series : $l");
  }

}