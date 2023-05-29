import 'dart:io';
void main(List<String> args) {
  print("Enter the n value");
  int n=int.parse(stdin.readLineSync()!);
  int count=0;
  String s="";
  List<String> stars=[];

  for(int i=0;i<n;i++)
  {
    s="";
    for(int j=0;j<=count;j++)
    {
      s=s+"*";
    }
    count=count+2;
    stars.add(s);
  }
  stars.forEach((element) {print(element);});
  stars.removeLast();
  stars=stars.reversed.toList();
  stars.forEach((element) {print(element);});
}