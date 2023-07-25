/*
 * Copyright (C) 2023 Open Mobile Platform LLC.
 */
import 'package:flutter/material.dart';
import 'package:flutter_example_packages/widgets/texts/text_base.dart';

class TextBodySmall extends TextBase {
  const TextBodySmall(
    super.data, {
    super.key,
    super.color,
    super.textAlign,
    super.fontWeight,
  });

  @override
  TextStyle? getStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall;
  }
}
