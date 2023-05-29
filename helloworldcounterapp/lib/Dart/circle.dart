import 'dart:math';

class Circle
{
  double radius=0;
  double getArea()
  {
    return this.radius*this.radius;
  }
  double getCircumference()
  {
    return 2*pi*this.radius;
  }
}
void main(List<String> args) {
  Circle c=Circle();
  c.radius=4.0;
  print("Area of Circle : ${c.getArea()}");
  print("Circumference of Circle : ${c.getCircumference()}");
}