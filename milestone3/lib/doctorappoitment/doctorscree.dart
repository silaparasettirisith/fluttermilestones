import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:milestone3/doctorappoitment/doctorhomepage.dart';

class DoctorScreen extends StatefulWidget {
  DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  var carousel_controller = CarouselController();
  var currentpos = 0;

  final List<String> imgList = [
    "images/d1.jpg",
    "images/d2.png"
  ];

  changedot(position) {
    setState(() {
      currentpos = position;
      carousel_controller.jumpToPage(currentpos);
      print(currentpos);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10,top:50,left: 20,right: 20),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (const Align(
                  alignment: Alignment.topRight,
                  child: Text("Skip",textScaleFactor: 2,),
                )),
                Padding(
                  padding: const EdgeInsets.only(top:100),
                  child: (CarouselSlider(
                    carouselController: carousel_controller,
                    options: CarouselOptions(
                      onScrolled: (value) {
                        print(value);
                      },
                      initialPage: currentpos,
                      reverse: false,
                      onPageChanged: (index, reason) {
                        changedot(index);
                      },
                    ),
                    items: imgList
                        .map((item) => Container(
                              child: Center(
                                  child: Image.asset(item,
                                      fit: BoxFit.cover, width: 1000)),
                            ))
                        .toList(),
                  )),
                ),
                DotsIndicator(
                  onTap: (position) {
                    changedot(position);
                  },
                  dotsCount: imgList.length,
                  position: currentpos,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                const ListTile(
                  title: Text(
                    "Call a Doctor to Visit You",
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                      "Check the advisories issued by the Ministry of Health and Family Welfare before visiting a medical facility."),
                  titleTextStyle: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                          shape:MaterialStatePropertyAll(
                            RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                          ),
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 150))),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context)
                          {
                              return DoctorHomePage();
                          }));
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
