import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../presentation/presentation.dart';
import 'signup_auth_information_screen.dart';
import 'signup_basic_information_screen.dart';
import 'signup_contact_information_screen.dart';
import 'signup_user_type_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with TickerProviderStateMixin ,WidgetsBindingObserver {
  late TabController _tabController;
  int _currentIndex = 0;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_listenController);
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
    _tabController.removeListener(_listenController);
    _tabController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _listenController() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }
void _nextButton(){
    if(_currentIndex==4){
      ///navigate to home screen
    }else{
      _tabController.index++;
    }
}

  void _previousButton(){
    if(_currentIndex==0){
      Navigator.pop(context);
    }else{
      _tabController.index--;
    }
  }
  @override
  Widget build(BuildContext context) {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final bool isKeyboardVisible = bottomInset > 0;

    if (_isKeyboardVisible != isKeyboardVisible) {
      setState(() {
        _isKeyboardVisible = isKeyboardVisible;
      });
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: context.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: AppColors.loginGradient
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              height: _isKeyboardVisible?Dimensions.sm:Dimensions.xxxxl,),
            AnimatedPadding(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              padding: EdgeInsets.all(_isKeyboardVisible?Dimensions.xxxs:Dimensions.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(duration: const Duration(milliseconds: 1000), child: Center(child:  Text("Sign Up", style: TextStyles.title0Regular(color: Colors.white).copyWith(fontSize: 45),))),
                  const SizedBox(height: Dimensions.xxs,),
                  Visibility(
                    visible: _isKeyboardVisible?false:true,
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        opacity: _isKeyboardVisible?0:1,
                        child: FadeInUp(duration: const Duration(milliseconds: 1300), child:Center(child:  Text("Welcome to HOXEC", style: TextStyles.body0Regular(color: Colors.white,))),)),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              height: _isKeyboardVisible?Dimensions.xxxs:Dimensions.sm,),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.xxxxl), topRight: Radius.circular(Dimensions.xxxxl))
                ),
                child: Padding(
                  padding: Paddings.allLg,
                  child: Stack(
                    children: [
                      Column(
                        children: [Center(child: _progressIndicator(context.width)),
                          xlgSpacer(),
                          Expanded(
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _tabController,
                              children: _buildSignUpProcessChildren(),
                            ),
                          ),],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Visibility(
                          visible: _isKeyboardVisible?false:true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FadeInUp(
                                duration: const Duration(milliseconds: 900),
                                child: MediumFilledRegularButton(
                                  text: 'Previous',
                                  expanded: true,
                                  constraints: BoxConstraints(
                                      minWidth: context.width*0.3
                                  ),
                                  onPressed: _previousButton,
                                ),
                              ),
                              FadeInUp(
                                duration: const Duration(milliseconds: 900),
                                child: MediumFilledRegularButton(
                                  text: 'Next',
                                  constraints: BoxConstraints(
                                    minWidth: context.width*0.3
                                  ),
                                  expanded: true,
                                  onPressed: _nextButton,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _progressIndicator(deviceWidth) => Container(
    padding: const EdgeInsets.symmetric(horizontal: Dimensions.xlg),
    width: context.width,
    child: Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: deviceWidth ,
              height: deviceWidth * 0.01,
              decoration: BoxDecoration(
                color: AppColors.secondaryPurple.shade400,
                borderRadius: BorderRadius.circular(deviceWidth * 0.5),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: (deviceWidth / 4) * (_currentIndex),
              height: deviceWidth * 0.016,
              decoration: BoxDecoration(
                color: AppColors.primaryPremiumColor,
                borderRadius: BorderRadius.circular(deviceWidth * 0.5),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  _buildSignUpProcessChildren() {
    return [
      const SignupUserTypeScreen(),
      const SignupAuthInformationScreen(),
      const SignupBasicInformationScreen(),
      const SignupContactInformationScreen(),
    ];
  }
}
