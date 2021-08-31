import 'package:flutter/material.dart';
import 'package:horoscope/HoroscopeDetail.dart';
import 'package:horoscope/model/horoscope.dart';

class HoroscopeItem extends StatelessWidget {
  final Horoscope horoscopeToList;

  const HoroscopeItem({required this.horoscopeToList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HoroscopeDetailPage(
                        selectionHoroscope: horoscopeToList)));
            print("Detail page come ");
          },
          leading: Image.asset(
            "images/" + horoscopeToList.horoscopeSmallImages,
            fit: BoxFit.cover,
          ),
          title: Text(horoscopeToList.horoscopeName),
          subtitle: Text(horoscopeToList.horoscopeHistory),
          trailing: Icon(
            Icons.arrow_right,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}
