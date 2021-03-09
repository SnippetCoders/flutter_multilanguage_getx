import 'package:flutter/material.dart';

import 'localization_service.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String lng;

  @override
  void initState() {
    super.initState();
    lng = LocalizationService().getCurrentLang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Multilanguage App"),
        elevation: 0,
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: _uiWidget(),
      ),
    );
  }

  Widget _uiWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "hello_title".tr,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Language",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("       "),
            new DropdownButton<String>(
              items: LocalizationService.langs.map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              value: this.lng,
              underline: Container(color: Colors.transparent),
              isExpanded: false,
              onChanged: (newVal) {
                setState(() {
                  this.lng = newVal;
                  LocalizationService().changeLocale(newVal);
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
