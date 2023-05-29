abstract class Shape
{
 double calculateArea();
}
class Circle extends Shape
{
  double radius=2.0;

  @override
  double calculateArea() {
    return this.radius*this.radius;
  }}
class Rectangle extends Shape
{
  double length=6;
  double width=10;
  @override
  double calculateArea() {
    // TODO: implement calculateArea
    return length*width;
  }
  
}
class Triangle  extends Shape
{
  double base=6;
  double height=10;
  @override
  double calculateArea() {
    // TODO: implement calculateArea
    return (1/2)*base*height;
  }
  
}

void main(List<String> args) {
  Circle c=new Circle();
  print("The Area of Circle : ${c.calculateArea()}");

  Rectangle r=new Rectangle();
  print("The Area of Triangle : ${r.calculateArea()}");

  Triangle t=new Triangle();
  print("The Area of Triangle : ${t.calculateArea()}");
}