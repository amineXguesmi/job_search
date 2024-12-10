import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:job_search/presentation/presentation.dart';
import 'package:job_search/presentation/theme/theme.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> with WidgetsBindingObserver {
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final bool isKeyboardVisible = bottomInset > 0;

    if (_isKeyboardVisible != isKeyboardVisible) {
      setState(() {
        _isKeyboardVisible = isKeyboardVisible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: AppColors.loginGradient,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              height: _isKeyboardVisible ? Dimensions.sm : Dimensions.xxxxl,
            ),
            AnimatedPadding(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              padding: EdgeInsets.all(_isKeyboardVisible ? Dimensions.xxxs : Dimensions.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyles.title0Regular(color: Colors.white).copyWith(fontSize: 45),
                      ),
                    ),
                  ),
                  const SizedBox(height: Dimensions.xxs),
                  Visibility(
                    visible: !_isKeyboardVisible,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      opacity: _isKeyboardVisible ? 0 : 1,
                      child: FadeInUp(
                        duration: const Duration(milliseconds: 1300),
                        child: Center(
                          child: Text(
                            "Welcome back",
                            style: TextStyles.body0Regular(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              height: _isKeyboardVisible ? Dimensions.xxxs : Dimensions.sm,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.xxxxl),
                    topRight: Radius.circular(Dimensions.xxxxl),
                  ),
                ),
                child: Padding(
                  padding: Paddings.allLg,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        xmdSpacer(),
                        FadeIn(
                          duration: const Duration(milliseconds: 1400),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(Dimensions.xxs),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: Dimensions.sm,
                                  offset: Offset(0, 10),
                                )
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(Dimensions.xxs),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      hintText: "Email or Phone number",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(Dimensions.xxs),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                  ),
                                  child: const TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        mdSpacer(),
                        FadeInUp(
                          duration: const Duration(milliseconds: 900),
                          child: const Text("Forgot Password?", style: TextStyle(color: Colors.grey)),
                        ),
                        mdSpacer(),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: MaterialButton(
                            onPressed: () {},
                            color: Colors.orange[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: const EdgeInsets.all(Dimensions.xxs),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        xxsSpacer(),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: MaterialButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              Navigator.pushNamed(context, '/signup');
                            },
                            color: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: const EdgeInsets.all(Dimensions.xxs),
                            child: const Center(
                              child: Text(
                                "Signup",
                                style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        lgSpacer(),
                        FadeIn(
                          duration: const Duration(milliseconds: 1700),
                          child: const Text("Continue with social media", style: TextStyle(color: Colors.grey)),
                        ),
                        lgSpacer(),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FadeInUp(
                                duration: const Duration(milliseconds: 1200),
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.all(Dimensions.xxs),
                                  child: const Center(
                                    child: Text(
                                      "Facebook",
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            lgSpacer(),
                            Expanded(
                              child: FadeInUp(
                                duration: const Duration(milliseconds: 1300),
                                child: MaterialButton(
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.all(Dimensions.xxs),
                                  color: Colors.black,
                                  child: const Center(
                                    child: Text(
                                      "Gmail",
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
