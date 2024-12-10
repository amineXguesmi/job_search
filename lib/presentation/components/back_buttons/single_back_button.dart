import 'package:flutter/material.dart';

import 'back_buttons_widgets.dart';

void callBack(BuildContext context) {
  Navigator.of(context).pop();
}

Widget singleBackButton({
  required double deviceWidth,
  required double deviceHeight,
  required BuildContext context,
  bool useCallback = false,
  Function? callback,
}) {
  return Stack(
    children: [
      Material(
        color: Colors.transparent,
        child: Hero(
          tag: 'singleBackButton',
          child: Material(
            type: MaterialType.transparency, // likely needed
            child: Container(
              height: deviceHeight * 0.083,
              padding: EdgeInsets.only(top: deviceHeight * 0.005),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: deviceHeight * 0.009,
                      left: deviceWidth * 0.01,
                      right: deviceWidth * 0.01,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (callback == null) {
                          Navigator.of(context).pop();
                        } else {
                          callback();
                        }
                      },
                      child: backButton(deviceWidth, deviceHeight),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
