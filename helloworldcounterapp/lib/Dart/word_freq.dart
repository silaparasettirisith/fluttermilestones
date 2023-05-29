import 'dart:io';

void main(List<String> args) {
  print("Enter the Sentence");
  String? sentence=stdin.readLineSync();
  var words=sentence?.split(" ");
  Map<String,int> word_freq=new Map();
  words?.forEach((element) {
    if(element.trim().length>=1)
      word_freq[element]=word_freq[element]==null?1:word_freq[element]!+1;
  });
  print(word_freq);
}