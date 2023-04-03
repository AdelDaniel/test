import 'dart:math';
import 'package:flutter/material.dart';
import 'package:test/const_values.dart';

/// The First Screen the user will see when open the app
class HomeScreen extends StatefulWidget {
  /// The HomeScreen Const Constructor
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// The background color of the screen,
  /// where [Colors.white] is the initial color of the screen
  Color _screenBackgroundColor = Colors.white;
  double _helloFontSize = 16;
  double _thereFontSize = 16;
  int _quarterTurns = 0;

  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _screenBackgroundColor,
      body: InkWell(
        onTap: _onTapScreen,
        child: Center(
          child: RotatedBox(
            quarterTurns: _quarterTurns,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Hello",
                    style: TextStyle(fontSize: _helloFontSize),
                  ),
                  const TextSpan(text: " "),
                  TextSpan(
                    text: "there",
                    style: TextStyle(fontSize: _thereFontSize),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// This method will generate random number
  ///  Value is [min] >= 0 and <= [max].
  int _getRandomNumber({int min = 0, required int max}) {
    return min + _random.nextInt((max + 1) - min);
  }

  /// The Color Range Values are the values from 0 to 255 = 165.
  ///
  /// The maximum number of color range is 255
  /// The minimum number of color range is 0
  /// Out of range values are brought into range using modulo 255.
  int _getNumberBetween0And256() {
    return _getRandomNumber(max: ConstValues.maxColorRangeValue);
  }

  double _getNumberBetween12And50() {
    return _getRandomNumber(
      min: ConstValues.minFontSize,
      max: ConstValues.maxFontSize,
    ).toDouble();
  }

  void _changeBackGroundColor() {
    _screenBackgroundColor = Color.fromRGBO(
      _getNumberBetween0And256(),
      _getNumberBetween0And256(),
      _getNumberBetween0And256(),
      ConstValues.maxOpacityValue,
    );
  }

  void _changeFontSize() {
    _helloFontSize = _getNumberBetween12And50();
    _thereFontSize =
        ConstValues.maxFontSize - _helloFontSize + ConstValues.minFontSize;
  }

  void _changeQuarterTurns() {
    _quarterTurns = _getRandomNumber(max: ConstValues.quartersNumber);
  }

  void _onTapScreen() {
    setState(() {
      _changeBackGroundColor();
      _changeFontSize();
      _changeQuarterTurns();
    });
  }
}
