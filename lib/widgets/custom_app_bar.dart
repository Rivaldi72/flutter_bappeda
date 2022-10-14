import 'package:flutter/material.dart';
import 'package:bappeda_app/shared/theme.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget? leadingIcon;
  const CustomAppBar({
    Key? key,
    this.leadingIcon,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(),
      title: Text(
        title,
        style: whiteTextStyle.copyWith(
          fontSize: 20,
          fontWeight: bold,
        ),
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_app_bar_copy.png'),
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
