import 'package:flutter/material.dart';
import 'package:bappeda_app/shared/theme.dart';

class CustomListMenuItem extends StatelessWidget {
  final String? icon, title;
  final Function()? action;

  const CustomListMenuItem({
    Key? key,
    this.icon,
    this.title,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
        height: 100,
        decoration: BoxDecoration(
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Image.asset(
              icon ?? 'assets/images/icon_cat_type.png',
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title ?? 'Untitled',
                style: blackTextStyle.copyWith(
                  fontSize: 26,
                  fontWeight: bold,
                  height: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
