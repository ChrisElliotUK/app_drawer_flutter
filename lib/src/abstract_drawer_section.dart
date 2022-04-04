import 'package:flutter/material.dart';

abstract class AbstractDrawerSection extends StatelessWidget {
  final bool showBottomDivider = true;
  final String? title;

  const AbstractDrawerSection({
    Key? key,
    this.title,
  }) : super(key: key);
}
