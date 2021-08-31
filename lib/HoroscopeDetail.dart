import 'package:flutter/material.dart';
import 'package:horoscope/model/horoscope.dart';
import 'package:palette_generator/palette_generator.dart';

class HoroscopeDetailPage extends StatefulWidget {
  final Horoscope selectionHoroscope;
  HoroscopeDetailPage({required this.selectionHoroscope, Key? key})
      : super(key: key);

  @override
  _HoroscopeDetailPageState createState() => _HoroscopeDetailPageState();
}

class _HoroscopeDetailPageState extends State<HoroscopeDetailPage> {
  Color appBarColor = Colors.transparent;

  late PaletteGenerator _generator;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) => appBarColorFind);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: false,
            backgroundColor: appBarColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.selectionHoroscope.horoscopeName),
              centerTitle: true,
              background: Image.asset(
                "images/" + widget.selectionHoroscope.horoscopeBigImages,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  widget.selectionHoroscope.horoscopeDetail,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  appBarColorFind() async {
    _generator = await PaletteGenerator.fromImageProvider(
      AssetImage("images/${widget.selectionHoroscope.horoscopeBigImages}"),
    );
    setState(() {
      appBarColor = _generator.dominantColor!.color;
    });
  }
}
