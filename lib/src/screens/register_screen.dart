import 'package:flutter/material.dart';
import 'package:kento/src/components/circle_indicator.dart';
import 'package:kento/src/components/number_picker.dart';
import 'package:kento/src/config/assets.dart';
import 'package:kento/src/config/palette.dart';
import 'package:kento/src/config/slide_left_route.dart';
import 'package:kento/src/config/styles.dart';
import 'package:kento/src/screens/chat_slide_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  int currentPage = 0;
  int age = 18;
  bool isKeyboardOpen =
      false; //this variable keeps track of the keyboard, when its shown and when its hidden

  PageController pageController =
      PageController(); // this is the controller of the page. This is used to navigate back and forth between the pages

  //Fields related to animation of the gradient
  Alignment begin = Alignment.center;
  Alignment end = Alignment.bottomRight;

  //Fields related to animating the layout and pushing widgets up when the focus is on the username field
  AnimationController usernameFieldAnimationController;
  Animation<double> profilePicHeightAnimation, usernameAnimation, ageAnimation;
  FocusNode usernameFocusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    usernameFieldAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    profilePicHeightAnimation = Tween<double>(begin: 100.0, end: 0.0)
        .animate(usernameFieldAnimationController)
          ..addListener(() {
            setState(() {});
          });
    usernameAnimation = Tween<double>(begin: 50.0, end: 10.0)
        .animate(usernameFieldAnimationController)
          ..addListener(() {
            setState(() {});
          });
    ageAnimation = Tween<double>(begin: 80.0, end: 10.0)
        .animate(usernameFieldAnimationController)
          ..addListener(() {
            setState(() {});
          });
    usernameFocusNode.addListener(() {
      if (usernameFocusNode.hasFocus) {
        usernameFieldAnimationController.forward();
      } else {
        usernameFieldAnimationController.reverse();
      }
    });
    pageController.addListener(() {
      setState(() {
        begin = Alignment(pageController.page, pageController.page);
        end = Alignment(1 - pageController.page, 1 - pageController.page);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop, //user to override the back button press
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          //  avoids the bottom overflow warning when keyboard is shown
          body: SafeArea(
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: begin,
                          end: end,
                          colors: <Color>[
                        Palette.gradientStartColor,
                        Palette.gradientEndColor
                      ])),
                  child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        AnimatedContainer(
                            duration: const Duration(milliseconds: 1500),
                            child: PageView(
                                controller: pageController,
                                physics: const NeverScrollableScrollPhysics(),
                                onPageChanged: (int page) =>
                                    updatePageState(page),
                                children: <Widget>[
                                  buildPageOne(),
                                  buildPageTwo()
                                ])),
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for (int i = 0; i < 2; i++)
                                CircleIndicator(i == currentPage),
                            ],
                          ),
                        ),
                        AnimatedOpacity(
                            opacity: currentPage == 1
                                ? 1.0
                                : 0.0, //shows only on page 1
                            duration: const Duration(milliseconds: 500),
                            child: Container(
                                margin: const EdgeInsets.only(
                                    right: 20, bottom: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    FloatingActionButton(
                                      onPressed: () => navigateToHome(),
                                      elevation: 0,
                                      backgroundColor: Palette.primaryColor,
                                      child: Icon(
                                        Icons.done,
                                        color: Palette.accentColor,
                                      ),
                                    )
                                  ],
                                )))
                      ]))),
        ));
  }

  Container buildPageOne() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(top: 250),
              child: Image.asset(Assets.app_icon_fg, height: 100)),
          Container(
              margin: const EdgeInsets.only(top: 30),
              child: Text('Kento Messenger',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22))),
          Container(
              margin: const EdgeInsets.only(top: 100),
              child: ButtonTheme(
                  height: 40,
                  child: RaisedButton.icon(
                      onPressed: () => updatePageState(1),
                      elevation: 0,
                      color: Colors.transparent,
                      icon: Image.asset(
                        Assets.google_button,
                        height: 25,
                      ),
                      label: Text(
                        'Sign In with Google',
                        style: TextStyle(
                            color: Palette.primaryTextColorLight,
                            fontWeight: FontWeight.w800),
                      ))))
        ],
      ),
    );
  }

  InkWell buildPageTwo() {
    return InkWell(
        // to dismiss the keyboard when the user tabs out of the TextField
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: profilePicHeightAnimation.value),
              Container(
                  child: CircleAvatar(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.camera,
                      color: Colors.white,
                      size: 15,
                    ),
                    Text(
                      'Set Profile Picture',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
                backgroundImage: Image.asset(Assets.user).image,
                radius: 60,
              )),
              SizedBox(
                height: ageAnimation.value,
              ),
              Text(
                'How old are you?',
                style: Styles.questionLight,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  NumberPicker.horizontal(
                      initialValue: age,
                      minValue: 15,
                      maxValue: 100,
                      highlightSelectedValue: true,
                      onChanged: (num value) {
                        setState(() {
                          age = value.toInt();
                        });
                        //   print(age);
                      }),
                  Text('Years', style: Styles.textLight)
                ],
              ),
              SizedBox(
                height: usernameAnimation.value,
              ),
              Container(
                child: Text(
                  'Choose a username',
                  style: Styles.questionLight,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: 120,
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: Styles.subHeadingLight,
                    focusNode: usernameFocusNode,
                    decoration: InputDecoration(
                      hintText: '@username',
                      hintStyle: Styles.hintTextLight,
                      contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Palette.primaryColor, width: 0.1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Palette.primaryColor, width: 0.1),
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }

  void updatePageState(int index) {
    if (index == 1)
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.linear);

    setState(() {
      currentPage = index;
    });
  }

  Future<bool> onWillPop() {
    if (currentPage == 1) {
      //go to first page if currently on second page
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
      return Future<bool>.value(false);
    }
    return Future<bool>.value(true);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    usernameFieldAnimationController.dispose();
    usernameFocusNode.dispose();
    super.dispose();
  }

  ///
  /// This routine is invoked when the window metrics have changed.
  ///
  @override
  void didChangeMetrics() {
    final double value = MediaQuery.of(context).viewInsets.bottom;
    if (value > 0) {
      if (isKeyboardOpen) {
        onKeyboardChanged(false);
      }
      isKeyboardOpen = false;
    } else {
      isKeyboardOpen = true;
      onKeyboardChanged(true);
    }
  }

  void onKeyboardChanged(bool isVisible) {
    if (!isVisible) {
      FocusScope.of(context).requestFocus(FocusNode());
      usernameFieldAnimationController.reverse();
    }
  }

  void navigateToHome() {
    Navigator.push(
      context,
      SlideLeftRoute(page: const ChatSlideScreen()),
    );
  }
}