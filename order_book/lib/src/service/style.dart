
import 'package:flutter/material.dart';
import '../entities/buy_sell.dart';

class OrderBookStyle {
  static const double cellHeight = 25.0;
  static const double growIconHeight = 16;
  
  static const TextStyle txtTileWhite = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static const TextStyle txtHeader = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static const TextStyle txtCurrentPricePrimary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );  
  static const TextStyle txtCurrentPriceAdditional = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  static const Color dividerColor = Colors.white10;  
  static Color askColor = BuySell.sell.getColor;
  static Color bidColor = BuySell.buy.getColor;
  static Color bidBackgroundColor = bidColor.withOpacity(0.15);  
  static Color askBackgroundColor = askColor.withOpacity(0.15);  
  static Color bidInactive = bidColor.withOpacity(0.30);  
  static Color askInactive = askColor.withOpacity(0.30); 

  static const updateFrequency = Duration(milliseconds: 300);
  static const mockGenerateFrequency = Duration(milliseconds: 500);
  static const mockDeleteLimit = 50;
  static const indicatorAnimationDuration = Duration(milliseconds: 200);
  static const insertAnimationDuration = Duration(milliseconds: 300);
  static const removeAnimationDuration = Duration(milliseconds: 300);

  static const changedIndicationDuration = Duration(milliseconds: 1000);

  static const updateVisibleDataFrequency = Duration(milliseconds: 300);

}
