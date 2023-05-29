class Vehicle
{
  String? vehicle_name;
  String? vehicle_model;
  int? year;
  void displayDetails()
  {
    print("Vehicle Name:$vehicle_name");
    print("Vehicle Model:$vehicle_model");
    print("Vehicle Year:$year");
  }
}
class Car extends Vehicle
{
  int? doors;
  @override
  void displayDetails() {
    super.displayDetails();
     print("No of Doors:$doors");
  }
}
class Motorcycle extends Vehicle
{
  bool? hasSidecar; 
  @override
  void displayDetails() {
    // TODO: implement displayDetails
    super.displayDetails();
    print("Has Side Car:$hasSidecar");
  }
}

void main(List<String> args) {
  Car car=Car();
  car.vehicle_name="Audi";
  car.vehicle_model="v4";
  car.year=2020;
  car.doors=1;
  car.displayDetails();
}