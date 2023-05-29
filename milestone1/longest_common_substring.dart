import 'dart:io';

void lcs(String a, String b, int i, int j, String s) {
  if (i >= a.length || j >= b.length) {
    if (s.length != 0) {
      if (result.length < s.length) result = s;
    }
    return;
  } else {
    if (a[i] == b[j]) {
      lcs(a, b, i + 1, j + 1, s + a[i]);
    } else {
      lcs(a, b, i + 1, j, s);
      lcs(a, b, i, j + 1, s);
    }
  }
}

var result = "";
void main(List<String> args) {
  print("Enter First String : ");
  String a = stdin.readLineSync()!; /* abcdefg */
  print("Enter Second String");
  String b = stdin.readLineSync()!; /* xyzabcdewpq */
  var array = List.generate(a.length+1, (i) => List.generate(b.length+1, (j) => 0));
  var m = a.length;
  var n = b.length;
  int length = 0;
  for (int i = 0; i <=m; i++) {
    for (int j = 0; j <=n; j++) {
      if (i == 0 || j == 0)
        array[i][j] = 0;
      else if (a[i - 1] == b[j - 1]) {
        array[i][j] = array[i - 1][j - 1] + 1;
        if (length < array[i][j]) {
          length = array[i][j];
        }
      } else
        array[i][j] = 0;
    }
  }

  print("The Longest Common Substring is ${length}");
}
