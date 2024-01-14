import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {

  double width([double factor = 1]) => MediaQuery.of(this).size.width * factor;

  double height([double factor = 1]) =>
      MediaQuery.of(this).size.height * factor;
}
