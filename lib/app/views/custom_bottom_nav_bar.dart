import 'package:embric/app/models/navbar_tab_config.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final List<ItemConfig> items;
  final int currentIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          final item = items[i];
          final isSelected = i == currentIndex;

          return GestureDetector(
            onTap: () => onItemSelected(i),
            child: SizedBox(
              width: 60,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 3,
                    width: 30,
                    color: isSelected
                        ? item.activeForegroundColor
                        : Colors.transparent,
                    margin: const EdgeInsets.only(bottom: 4),
                  ),
                  isSelected ? item.icon : item.inactiveIcon,
                  const SizedBox(height: 4),
                  Text(
                    item.title ?? "",
                    style: TextStyle(
                      color: isSelected
                          ? item.activeForegroundColor
                          : Colors.grey,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
