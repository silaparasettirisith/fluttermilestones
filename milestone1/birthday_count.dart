import 'dart:io';

void main(List<String> args) {
  print("Enter Date of birth in yy-mm-dd Format");
  String? inputdate=stdin.readLineSync(); /* format yy-mm-dd */
  DateTime dob=DateTime.parse(inputdate!);
  DateTime d=DateTime.now();

  DateTime current=DateTime(d.year,dob.month,dob.day);

  
  if(dob.month<=d.month)
  {
    if(dob.month==d.month)
    {
      if(dob.day<d.day)
      {
        d=new DateTime(d.year+1,dob.month,dob.day);
      }
    }
    else
    {
      print(d.month+1);
      d=new DateTime(d.year+1,dob.month,dob.day);
    }
  }
  var noOfDays=current.difference(d).inDays;
  print("The number of days until the birthday $noOfDays");


}