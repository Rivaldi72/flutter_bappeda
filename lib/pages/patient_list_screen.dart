import 'package:flutter/material.dart';
import 'package:bappeda_app/shared/theme.dart';
import 'package:bappeda_app/widgets/custom_app_bar.dart';
import 'package:bappeda_app/widgets/custom_patient_list_item.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({Key? key}) : super(key: key);

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: CustomAppBar(
            title: 'Jenis-Jenis Kucing',
          ),
        ),
        body: FutureBuilder(
          future: getPatientData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return Center(
                  child: Text(
                    'Data masih kosong',
                    style:
                        blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                itemBuilder: (context, index) {
                  final cat = snapshot.data![index];
                  return CustomCatTypeListItem(
                    image: 'assets/markers/${index + 1}.jpg',
                    name: cat.name,
                    type: cat.type,
                    action: () {
                      Navigator.pushNamed(context, '/cat-detail',
                          arguments: {'catID': cat.id});
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
