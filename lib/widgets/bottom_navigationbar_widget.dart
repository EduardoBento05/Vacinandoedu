import 'package:flutter/material.dart';
import '../theme/custom_black_theme.dart';

class BottomNavigationWidget extends StatelessWidget {
  final List<Widget> buttons;

  const BottomNavigationWidget({
    Key? key,
    required this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = (Theme.of(context).brightness == Brightness.dark);

    return Container(
      color: isDark
          ? CustomBlackTheme.black.shade900
          : CustomBlackTheme.black.shade100,
      padding: const EdgeInsets.only(top: 1),
      child: BottomAppBar(
        height: 60,
        elevation: 0,
        color: isDark
            ? CustomBlackTheme.black.shade900
            : CustomBlackTheme.black.shade50,
        child: IconTheme(
          data: IconThemeData(
            color: isDark
                ? CustomBlackTheme.black.shade300
                : CustomBlackTheme.black.shade800,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ...buttons
                    .expand((button) => [const SizedBox(width: 16), button]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
