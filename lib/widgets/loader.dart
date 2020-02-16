import 'package:flutter/material.dart';

class Loader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4,
          ),
        ),
      ),
    );
  }
}
