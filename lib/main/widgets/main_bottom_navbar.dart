import 'package:copyparrot/main/providers/main_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/pallete.dart';

class MainBottomNavbar extends ConsumerWidget {
  const MainBottomNavbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(mainIndexViewmodelProvider);
    return BottomAppBar(
      padding: EdgeInsets.zero,
      height: 55,
      color: Pallete.navbarColor,
      child: Row(
        children: [0, 1]
            .map((val) => _navItem(
                val,
                val == selectedIndex,
                () => ref
                    .read(mainIndexViewmodelProvider.notifier)
                    .selectIndex(val),
                context))
            .toList(),
      ),
    );
  }

  Widget _navItem(
      int index, bool selected, VoidCallback onTap, BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 56,
                height: 41,
                child: Image.asset(
                  color: selected ? Pallete.blueColor : Pallete.greyAColor,
                  "assets/images/menu-${index}.png",
                ),
              ),
              SizedBox(
                height: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
