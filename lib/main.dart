import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController pageController = PageController();
  PageController textController = PageController();
  PageController descriptionController = PageController();

  int selectedIndex = 0;
  List<Color> colorList = [
    Color(0xFFFFFFFF),
    Color(0xFF98DFD5),
    Color(0xFFFFADC4),
  ];

  List<Color> nextColorList = [
    Color(0xFF98DFD5),
    Color(0xFFFFADC4),
    Color(0xFFFFFFFF),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorList[selectedIndex],
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Colors.transparent,
          ),
          Positioned(
            right: 0,
            child: SizedBox(
              height: size.height,
              width: 76,
              child: ClipPath(
                child: Container(
                  color: nextColorList[selectedIndex],
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: size.height * 0.195, right: 15),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex == 2
                                ? (selectedIndex = 0)
                                : selectedIndex++;

                            pageController.animateToPage(
                              selectedIndex,
                              duration: const Duration(seconds: 1),
                              curve: Curves.ease,
                            );
                            textController.animateToPage(
                              selectedIndex,
                              duration: const Duration(seconds: 1),
                              curve: Curves.ease,
                            );
                            descriptionController.animateToPage(
                              selectedIndex,
                              duration: const Duration(seconds: 1),
                              curve: Curves.ease,
                            );
                          });
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                            border: Border.all(
                                color: selectedIndex == 2
                                    ? Colors.black
                                    : Colors.white,
                                width: 0.7),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: selectedIndex == 2
                                ? Colors.black
                                : Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                clipper: ClipPathClass(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Petty',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 18.0),
                      child: Text('skip'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 400,
                  width: 400,
                  child: PageView(
                    controller: pageController,
                    children: [
                      Center(
                        child: SvgPicture.asset('assets/Group 1.svg'),
                      ),
                      Center(
                        child: SvgPicture.asset('assets/Group 2.svg'),
                      ),
                      Center(
                        child: SvgPicture.asset('assets/Group 3.svg'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 41,
                ),
                SizedBox(
                  width: size.width * 0.7,
                  height: 70,
                  child: PageView(
                    controller: textController,
                    children: const [
                      Text(
                        'Learning became \nEasy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'Learning became \nEasy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'Learning became \nEasy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  width: size.width * 0.7,
                  height: 60,
                  child: PageView(
                    controller: descriptionController,
                    children: const [
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet ut nec vitae gravida ullamcorper .',
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet ut nec vitae gravida ullamcorper .',
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet ut nec vitae gravida ullamcorper .',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 20,
                  width: 100,
                  child: Row(
                    children: List.generate(
                      3,
                      (index) => Container(
                        height: 13,
                        width: 13,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Colors.grey
                              : Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = 1;
    final double _yScaling = size.height * 0.0014;
    path.lineTo(60.9997 * _xScaling, -1.5 * _yScaling);
    path.cubicTo(
      60.9997 * _xScaling,
      -1.5 * _yScaling,
      75.9997 * _xScaling,
      -1.5 * _yScaling,
      75.9997 * _xScaling,
      -1.5 * _yScaling,
    );
    path.cubicTo(
      75.9997 * _xScaling,
      -1.5 * _yScaling,
      75.9997 * _xScaling,
      811.5 * _yScaling,
      75.9997 * _xScaling,
      811.5 * _yScaling,
    );
    path.cubicTo(
      75.9997 * _xScaling,
      811.5 * _yScaling,
      60.9997 * _xScaling,
      811.5 * _yScaling,
      60.9997 * _xScaling,
      811.5 * _yScaling,
    );
    path.cubicTo(
      60.9997 * _xScaling,
      811.5 * _yScaling,
      60.9997 * _xScaling,
      663.25 * _yScaling,
      60.9997 * _xScaling,
      663.25 * _yScaling,
    );
    path.cubicTo(
      60.9997 * _xScaling,
      663.25 * _yScaling,
      60.9997 * _xScaling,
      676.901 * _yScaling,
      60.9997 * _xScaling,
      654.763 * _yScaling,
    );
    path.cubicTo(
      60.9997 * _xScaling,
      610.638 * _yScaling,
      0.5 * _xScaling,
      595 * _yScaling,
      0.5 * _xScaling,
      556 * _yScaling,
    );
    path.cubicTo(
      0.5 * _xScaling,
      517 * _yScaling,
      60.9997 * _xScaling,
      501.5 * _yScaling,
      60.9997 * _xScaling,
      462.638 * _yScaling,
    );
    path.cubicTo(
      60.9997 * _xScaling,
      440.5 * _yScaling,
      60.9997 * _xScaling,
      452 * _yScaling,
      60.9997 * _xScaling,
      452 * _yScaling,
    );
    path.cubicTo(
      60.9997 * _xScaling,
      452 * _yScaling,
      60.9997 * _xScaling,
      -1.5 * _yScaling,
      60.9997 * _xScaling,
      -1.5 * _yScaling,
    );
    path.cubicTo(
      60.9997 * _xScaling,
      -1.5 * _yScaling,
      60.9997 * _xScaling,
      -1.5 * _yScaling,
      60.9997 * _xScaling,
      -1.5 * _yScaling,
    );
    // path.lineTo(31 * _xScaling, 551 * _yScaling);
    // path.cubicTo(
    //   31 * _xScaling,
    //   551 * _yScaling,
    //   35.5 * _xScaling,
    //   555.5 * _yScaling,
    //   35.5 * _xScaling,
    //   555.5 * _yScaling,
    // );
    // path.cubicTo(
    //   35.5 * _xScaling,
    //   555.5 * _yScaling,
    //   31 * _xScaling,
    //   560 * _yScaling,
    //   31 * _xScaling,
    //   560 * _yScaling,
    // );
    // path.lineTo(31 * _xScaling, 551 * _yScaling);
    // path.cubicTo(
    //   31 * _xScaling,
    //   551 * _yScaling,
    //   35.5 * _xScaling,
    //   555.5 * _yScaling,
    //   35.5 * _xScaling,
    //   555.5 * _yScaling,
    // );
    // path.cubicTo(
    //   35.5 * _xScaling,
    //   555.5 * _yScaling,
    //   31 * _xScaling,
    //   560 * _yScaling,
    //   31 * _xScaling,
    //   560 * _yScaling,
    // );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
