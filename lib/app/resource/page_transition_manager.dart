import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Route nextPage({required Widget page}) {
  // Right to Left Ios Version -------------------------------------------------
  return PageTransition(
      type: PageTransitionType.rightToLeft, child: page, isIos: true);
  // Scale Animation -------------------------------------------------------
  /* return PageTransition(child: page, type: PageTransitionType.scale, alignment: Alignment.center); */
  // Fade Animation ------------------------------------------------------
  /* return PageTransition(type: PageTransitionType.fade, child: page); */
}
