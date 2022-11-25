import 'package:claundry_ui/screen/signup_screen.dart';
import 'package:claundry_ui/util/items.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<Widget> slides = items
      .map((item) => SizedBox(
          width: double.infinity,
          // padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: <Widget>[
              const Text('data'),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Image.asset(
                  item['image'],
                  fit: BoxFit.fitWidth,
                  width: 220.0,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: <Widget>[
                      Text(item['header'],
                          style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFF3F3D56),
                              height: 2.0)),
                      Text(
                        item['description'],
                        style: const TextStyle(
                            color: Colors.grey,
                            // letterSpacing: 1,
                            fontSize: 12.0,
                            height: 2.3),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )))
      .toList();

  List<Widget> indicator() => List<Widget>.generate(
      slides.length,
      (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                color: currentPage.round() == index
                    ? const Color(0XFFCE1567)
                    : const Color(0xff33000000).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0)),
          ));

  double currentPage = 0.0;
  final _pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    _pageViewController.addListener(() {
      setState(() {
        currentPage = _pageViewController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 275,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/splashing.png'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Momy Laundry',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ),
            PageView.builder(
              controller: _pageViewController,
              itemCount: slides.length,
              itemBuilder: (BuildContext context, int index) {
                return slides[index];
              },
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 30,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      const Text(
                        'Skip',
                        style:
                            TextStyle(fontSize: 14.0, color: Color(0xff38106A)),
                      ),
                      const SizedBox(
                        width: 230,
                      ),
                      ElevatedButton(
                        // style: ElevatedButton.styleFrom(
                        //     elevation: 10,
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(30.0))),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xffCE1567),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 350,
                  margin: const EdgeInsets.only(top: 70.0),
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: indicator(),
                  ),
                )
                //  ),
                ),

            // )
          ],
        ),
      ),
    );
  }
}
