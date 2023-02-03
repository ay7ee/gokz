import 'package:gokz/intro/login_signup_page.dart';
import 'package:gokz/main.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}


class _IntroScreenState extends State<IntroScreen> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

        listContentConfig.add(
      ContentConfig(
        marginTitle: const EdgeInsets.only(left:50, top: 300 ,right:50,),
        widgetTitle:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                   text: const TextSpan(
                    children: <TextSpan>[
                    TextSpan(text: 'Its a Big World Out\n There,', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono', )),
                    TextSpan(text: 'Go explore!', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono', backgroundColor: Color(0xffC04757))),
                  ],
  ),
),
              ],
            ),
          ],
        ),
        maxLineTitle: 2,
        backgroundImage: 'assets/images/image5.png',
        onCenterItemPress: () {},
      )
    );
        listContentConfig.add(
      ContentConfig(
        marginTitle: const EdgeInsets.only(left:50, top: 300 ,right:50,),
        widgetTitle:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                   text: const TextSpan(
                    children: <TextSpan>[
                    TextSpan(text: 'Explore the\n', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono', )),
                    TextSpan(text: 'Kazazkhstan!', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono', backgroundColor: Color(0xffC04757))),
                  ],
  ),
),
              ],
            ),
          ],
        ),
        maxLineTitle: 2,
        backgroundImage: 'assets/images/image2.png',
        onCenterItemPress: () {},
      )
    );
       listContentConfig.add(
      ContentConfig(
        marginTitle: const EdgeInsets.only(left:50, top: 300 ,right:50,),
        widgetTitle:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
               text: const TextSpan(
                children: <TextSpan>[
                TextSpan(text: 'Find Best Place For\n', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono', )),
                TextSpan(text: 'Your Vacation!', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono', backgroundColor: Color(0xffC04757))),
              ],
  ),
),
          ],
        ),
        maxLineTitle: 2,
        backgroundImage: 'assets/images/image3.jpg',
        onCenterItemPress: () {},
      )
    );
  }

  void onDonePress() {
    Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => LoginSignup()));
  }

  void onNextPress() {
    print("onNextPress caught");
  }

  Widget renderNextBtn() {
    return const Icon(
      Icons.navigate_next,
      size: 25,
    );
  }

  Widget renderDoneBtn() {
    return const Icon(
      Icons.done,
      size: 25,
    );
  }

    Widget renderSkipBtn() {
    return SizedBox(
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      // Content config
      listContentConfig: listContentConfig,
      backgroundColorAllTabs: Colors.transparent,

      renderSkipBtn: renderSkipBtn(),

      // Next button
      renderNextBtn: renderNextBtn(),
      onNextPress: onNextPress,
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: renderDoneBtn(),
      onDonePress: onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Indicator
      indicatorConfig: IndicatorConfig(
        indicatorWidget: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: Colors.white),
        ),
        spaceBetweenIndicator: 10,
        typeIndicatorAnimation: TypeIndicatorAnimation.sizeTransition,
      ),

      // Navigation bar
      navigationBarConfig: NavigationBarConfig(
        navPosition: NavPosition.bottom,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewPadding.bottom > 0 ? 20 : 10,
        ),
      ),

    );
  }
}