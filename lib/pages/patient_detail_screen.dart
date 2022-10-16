import 'dart:ui';
import 'package:bappeda_app/widgets/custom_patient_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bappeda_app/shared/theme.dart';
import 'package:bappeda_app/widgets/custom_app_bar.dart';
import 'package:flutter/widgets.dart';

class PatientDetailScreen extends StatelessWidget {
  const PatientDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    print(arguments['medicalRecord']);
    // print(arguments);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 175,
            padding: const EdgeInsets.only(top: 65),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: kBlackColor.withOpacity(0.2),
                  blurRadius: 30,
                  offset: const Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Detail Pasien',
                      style: whiteTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: extraBold,
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Icon(
                      Icons.arrow_back,
                      color: kWhiteColor,
                      size: 29,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: ListView(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 23, bottom: 100),
              children: [
                CustomPatientListItem(
                  image: 'assets/images/${arguments['image']}.png',
                  name: arguments['name'],
                  gender: arguments['gender'],
                  action: () {},
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomCardTile(
                              title: 'Nomer Antrian',
                              value: arguments['noAntrian'].toString()),
                          CustomCardTile(
                              title: 'Umur (Tahun)',
                              value: arguments['umur'].toString()),
                          CustomCardTile(
                              title: 'Riwayat (Kali)',
                              value: arguments['history'].toString()),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Keluhan',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        '- ${arguments['medicalIssue']}',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Riwayat Penyakit',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: bold,
                        ),
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.all(0),
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: arguments['medicalRecords'].length,
                        itemBuilder: (context, index) {
                          final medicineLists = arguments['medicalRecords']
                              [index]['medicine_lists'];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '- ${arguments['medicalRecords'][index]['medical_issue']} (${arguments['medicalRecords'][index]['user']['name']})',
                                style: blackTextStyle.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '   Riwayat Obat',
                                style: blackTextStyle.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              ListView.builder(
                                padding: const EdgeInsets.all(0),
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: medicineLists.length != 0
                                    ? medicineLists.length
                                    : 1,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      medicineLists.length != 0
                                          ? Text(
                                              '   - ${medicineLists[index]['stock']['name']} (${medicineLists[index]['quantity']} tablet)',
                                              style: blackTextStyle.copyWith(
                                                fontSize: 20,
                                              ),
                                            )
                                          : Text(
                                              '   - Tidak ada pemberian obat -',
                                              style: blackTextStyle.copyWith(
                                                fontSize: 20,
                                              ),
                                            ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class CustomCardTile extends StatelessWidget {
  final String title, value;
  const CustomCardTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kGrayColor,
        boxShadow: [
          BoxShadow(
            color: kWhiteColor.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: blueTextStyle.copyWith(
              fontSize: 10,
              fontWeight: bold,
              letterSpacing: 2,
            ),
          ),
          Spacer(),
          Text(
            value,
            textAlign: TextAlign.center,
            style: blackTextStyle.copyWith(
              fontSize: 30,
              fontWeight: bold,
              letterSpacing: 2,
            ),
          )
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String value;
  const CustomListTile({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Text(
        value,
        style: blackTextStyle.copyWith(fontSize: 17),
      ),
    );
  }
}

class CustomTableCharacteristic extends StatelessWidget {
  final String title;
  final Widget value;
  const CustomTableCharacteristic({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFD5D5D5),
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            width: 130,
            child: Text(
              title,
              style: blackTextStyle.copyWith(fontSize: 17),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              color: kWhiteColor,
              child: value,
            ),
          )
        ],
      ),
    );
  }
}
