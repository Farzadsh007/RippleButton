import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onLongPress;
  final Function onLongPressEnd;

  const MyButton({Key key, this.onLongPress, this.onLongPressEnd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        LongPressGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
          () => LongPressGestureRecognizer(
            duration: const Duration(milliseconds: 100),
          ),
          (LongPressGestureRecognizer instance) {
            instance.onLongPress = () {
              if (onLongPress != null) onLongPress();
            };
            instance.onLongPressEnd = (details) {
              if (onLongPressEnd != null) onLongPressEnd();
            };
          },
        ),
      },
      child: Container(
        height: 150,
        width: 150,
        decoration: const BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
