import 'package:embric/app/constants/app_sizes.dart';
import 'package:embric/app/models/navbar_tab_config.dart';
import 'package:embric/app/services/size_helper.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final List<ItemConfig> items;
  final int currentIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      padding: EdgeInsets.symmetric(vertical: AppSizes.pagePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          final item = items[i];
          final isSelected = i == currentIndex;

          return GestureDetector(
            onTap: () => onItemSelected(i),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: AppSizes.navIndicatorHeight,
                  color: isSelected
                      ? item.activeForegroundColor
                      : Colors.transparent,
                  margin: EdgeInsets.only(bottom: AppSizes.navItemSpacing),
                ),
                isSelected ? item.icon : item.inactiveIcon,
                SizedBox(height: AppSizes.navItemSpacing),
                Text(
                  item.title ?? "",
                  style: TextStyle(
                    fontSize: scaledFontSize(AppSizes.fontSmall, context),
                    color: isSelected
                        ? item.activeForegroundColor
                        : Theme.of(context).unselectedWidgetColor,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}