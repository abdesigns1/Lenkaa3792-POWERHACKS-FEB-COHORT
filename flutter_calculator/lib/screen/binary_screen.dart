import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_calculator/controller/calculate_controller.dart';
import 'package:flutter_calculator/controller/theme_controller.dart';
import 'package:flutter_calculator/utils/colors.dart';
import 'package:flutter_calculator/widget/button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BinaryScreen extends StatelessWidget {
  BinaryScreen({Key? key}) : super(key: key);

  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
    "1's",
    "2's",
    "Sign",
    "Unsigned",
  ];

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CalculateController>();
    var themeController = Get.find<ThemeController>();

    return GetBuilder<ThemeController>(builder: (context) {
      return Scaffold(
        backgroundColor: themeController.isDark
            ? DarkColors.scaffoldBgColor
            : LightColors.scaffoldBgColor,
        body: Column(
          children: [
            GetBuilder<CalculateController>(builder: (context) {
              return outPutSection(themeController, controller);
            }),
            inPutSection(themeController, controller),
          ],
        ),
      );
    });
  }

  /// In put Section - Enter Numbers
  Widget inPutSection(
      ThemeController themeController, CalculateController controller) {
    return Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: themeController.isDark
                  ? DarkColors.sheetBgColor
                  : LightColors.sheetBgColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6),
              itemBuilder: (context, index) {
                switch (index) {
                  /// CLEAR BTN
                  case 0:
                    return CustomAppButton(
                      buttonTapped: () {
                        controller.clearInputAndOutput();
                      },
                      color: themeController.isDark
                          ? DarkColors.leftOperatorColor
                          : LightColors.leftOperatorColor,
                      textColor: themeController.isDark
                          ? DarkColors.btnBgColor
                          : LightColors.btnBgColor,
                      text: buttons[index],
                    );

                  /// DELETE BTN
                  case 1:
                    return CustomAppButton(
                        buttonTapped: () {
                          controller.deleteBtnAction();
                        },
                        color: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.leftOperatorColor,
                        textColor: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnBgColor,
                        text: buttons[index]);

                  /// EQUAL BTN
                  case 19:
                    return CustomAppButton(
                        buttonTapped: () {
                          controller.equalPressed();
                        },
                        color: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.leftOperatorColor,
                        textColor: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnBgColor,
                        text: buttons[index]);
                  case 20: // 1's complement
                  case 21: // 2's complement
                  case 22: // Sign
                  case 23: // Unsigned Magnitude
                    return CustomAppButton(
                      buttonTapped: () {
                        controller.onSpecialBtnTapped(buttons, index);
                      },
                      color: themeController.isDark
                          ? DarkColors.leftOperatorColor
                          : LightColors.leftOperatorColor,
                      textColor: themeController.isDark
                          ? DarkColors.btnBgColor
                          : LightColors.btnBgColor,
                      text: buttons[index],
                    );

                  default:
                    return CustomAppButton(
                      buttonTapped: () {
                        controller.onBtnTapped(buttons, index);
                      },
                      color: isOperator(buttons[index])
                          ? LightColors.operatorColor
                          : themeController.isDark
                              ? DarkColors.btnBgColor
                              : LightColors.btnBgColor,
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : themeController.isDark
                              ? Colors.white
                              : Colors.black,
                      text: buttons[index],
                    );
                }
              }),
        ));
  }

  /// Out put Section - Show Result
  Widget outPutSection(
      ThemeController themeController, CalculateController controller) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// theme switcher
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GetBuilder<ThemeController>(builder: (controller) {
            return AdvancedSwitch(
              controller: controller.switcherController,
              activeImage: const AssetImage('assets/day_sky.png'),
              inactiveImage: const AssetImage('assets/night_sky.jpg'),
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              activeChild: Text(
                'Day',
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold, fontSize: 17),
              ),
              inactiveChild: Text(
                'Night',
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(1000)),
              width: 100.0,
              height: 45.0,
              enabled: true,
              disabledOpacity: 0.5,
            );
          }),
        ),

        /// Main Result - user input and output
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 70),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  controller.userInput,
                  style: GoogleFonts.ubuntu(
                      color:
                          themeController.isDark ? Colors.white : Colors.black,
                      fontSize: 38),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  controller.userOutput,
                  style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    color: themeController.isDark ? Colors.white : Colors.black,
                    fontSize: 60,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  /// is Operator Check
  bool isOperator(String y) {
    if (y == "%" || y == "/" || y == "x" || y == "-" || y == "+" || y == "=") {
      return true;
    }
    return false;
  }
}
