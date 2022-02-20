import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:calculator_04/controllers/settings_controller.dart';










void themeApply({required Color
  screenBackgroundColor ,
  required Color displayFontColor,
  required Color grossResultFontColor,
  required Color subResultsFontColor,
  required Color actionButtonsColor,
  required Color buttonsBackgroundColor,
  required Color cursorColor,
  required Color enterButtonIconColor,
  required Color enterButtonBackgroundColor,
  required Color numbersColor,
  required Color onTapColor,
  required Color operatorsColor,
  required Color powerValuesColor,
})
{
int psc(Color color){
  return int.parse(color.value.toString());
}

sc.screenBackgroundColor.value = psc(screenBackgroundColor);
sc.displayFontColor.value = psc(displayFontColor);
sc.grossResultFontColor.value = psc(grossResultFontColor);
sc.subResultsFontColor.value = psc(subResultsFontColor);
sc.actionButtonsColor.value = psc(actionButtonsColor);
sc.buttonsBackgroundColor.value = psc(buttonsBackgroundColor);
sc.cursorColor.value = psc(cursorColor);
sc.enterButtonIconColor.value = psc(enterButtonIconColor);
sc.enterButtonBackgroundColor.value = psc(enterButtonBackgroundColor);
sc.numbersColor.value = psc(numbersColor);
sc.onTapColor.value = psc(onTapColor);
sc.operatorsColor.value = psc(operatorsColor);
sc.powerValuesColor.value = psc(powerValuesColor);


sbox.put(bm.screenBackgroundColor, psc(screenBackgroundColor));
sbox.put(bm.displayFontColor, psc(displayFontColor));
sbox.put(bm.grossResultFontColor, psc(grossResultFontColor));
sbox.put(bm.subResultsFontColor, psc(subResultsFontColor));
sbox.put(bm.actionButtonsColor, psc(actionButtonsColor));
sbox.put(bm.buttonsBackgroundColor, psc(buttonsBackgroundColor));
sbox.put(bm.cursorColor, psc(cursorColor));
sbox.put(bm.enterButtonIconColor, psc(enterButtonIconColor));
sbox.put(bm.enterButtonBackgroundColor, psc(enterButtonBackgroundColor));
sbox.put(bm.numbersColor, psc(numbersColor));
sbox.put(bm.onTapColor, psc(onTapColor));
sbox.put(bm.operatorsColor, psc(operatorsColor));
sbox.put(bm.powerValuesColor, psc(powerValuesColor));


}


