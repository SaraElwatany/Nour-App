import 'package:flutter/material.dart';
import 'package:nour_app/generated/l10n.dart';

String getLocalizedText(BuildContext context, String key) {
  switch (key) {
    case "not At All":
      return S.of(context).notatall;
    case "moderately":
      return S.of(context).moderately;
    case "extremely":
      return S.of(context).extremely;
    case "Quite a bit":
      return S.of(context).quitAbit;
    case "A little bit":
      return S.of(context).aLittleBit;
    default:
      return " ";
  }
}
