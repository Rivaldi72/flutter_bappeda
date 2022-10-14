import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bappeda_app/shared/theme.dart';
import 'package:bappeda_app/widgets/custom_app_bar.dart';
import 'package:bappeda_app/widgets/custom_patient_list_item.dart';
import 'package:http/http.dart' as http;

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({Key? key}) : super(key: key);

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  var patientData;
  Future<void> getPatientData() async {
    final response = await http.get(
        Uri.parse('https://ayo-wisuda.site/api/gedmi/siswa/indexsiswa/VII'));

    if (response.statusCode == 200) {
      patientData = jsonDecode(response.body.toString());
      return patientData;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: CustomAppBar(
            title: 'Daftar Pasien Hari Ini',
          ),
        ),
        body: FutureBuilder(
          future: getPatientData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: patientData.length,
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                itemBuilder: (context, index) {
                  getRandomNumber() {
                    Random random = new Random();
                    int randomNumber = random.nextInt(7);
                    return randomNumber;
                  }

                  final patients = snapshot.data as List;
                  return CustomPatientListItem(
                    image: 'assets/images/${getRandomNumber()}.png',
                    name: patients[index]['nama'],
                    action: () {
                      Navigator.pushNamed(context, '/patient-detail',
                          arguments: {
                            'name': patients[index]['nama'],
                            'image': getRandomNumber(),
                          });
                    },
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              );
            }
          },
        ));
  }
}
