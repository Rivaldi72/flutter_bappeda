import 'package:flutter/material.dart';
import 'package:bappeda_app/shared/theme.dart';

class CustomPatientListItem extends StatelessWidget {
  final String? image, name, nik, gender;
  final Function()? action;

  const CustomPatientListItem({
    Key? key,
    this.image,
    this.name,
    this.gender,
    this.nik,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
        height: 105,
        decoration: BoxDecoration(
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? 'Untitled',
                    style: blackTextStyle.copyWith(
                      fontSize: 22,
                      fontWeight: bold,
                      height: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            nik ?? '128718271872817',
                            style: secondaryBlackTextStyle.copyWith(
                              fontSize: 13,
                              height: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.circle,
                          size: 8,
                          color: kSecondaryBlackColor,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            gender ?? 'Perempuan',
                            style: secondaryBlackTextStyle.copyWith(
                              fontSize: 13,
                              height: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    image ?? 'assets/images/cat_test.jpeg',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
