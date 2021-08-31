import 'package:flutter/material.dart';
import 'package:horoscope/data/strings.dart';
import 'package:horoscope/horoscopeItem.dart';
import 'package:horoscope/model/horoscope.dart';

class HoroscopeList extends StatelessWidget {
  late List<Horoscope> allHoroscope;

  HoroscopeList() {
    allHoroscope = createDataSource();
  }

  List<Horoscope> createDataSource() {
    List<Horoscope> carrier = [];

    for (int i = 0; i < 12; i++) {
      var horoscopeName = Strings.Horoscope_Name[i];
      var horoscopeHistory = Strings.Horoscope_History[i];
      var horoscopeGeneralFeature = Strings.Horoscope_GeneralFeature[i];
      var horoscopeSmallImages =
          Strings.Horoscope_Name[i].toLowerCase() + "${i + 1}.png";
      var horoscopeBigImages =
          Strings.Horoscope_Name[i].toLowerCase() + "_buyuk" + "${i + 1}.png";

      Horoscope addHoroscope = Horoscope(horoscopeName, horoscopeHistory,
          horoscopeGeneralFeature, horoscopeSmallImages, horoscopeBigImages);

      carrier.add(addHoroscope);
    }
    return carrier;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horoscope"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            /*burada bılgılerden liste olusturuyoruz*/
            return HoroscopeItem(horoscopeToList: allHoroscope[index]);
          },
          itemCount: allHoroscope.length,
        ),
      ),
    );
  }
}
