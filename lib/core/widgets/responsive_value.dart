import 'package:flutter/widgets.dart';

import '../../app/breakpoints.dart';

T responsiveValue<T>(
  BuildContext context, {
  required T mobile,
  required T desktop,
  T? tablet,
}) {
  final width = MediaQuery.sizeOf(context).width;
  if (width >= Breakpoints.desktop) return desktop;
  if (width >= Breakpoints.mobile) return tablet ?? mobile;
  return mobile;
}
