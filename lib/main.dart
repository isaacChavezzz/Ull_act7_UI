import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telcel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'telcel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPD5vTmGeLLr-JQ1iiDFd53XsJbfFV8Fnf2w&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSovqetrkc8Gi17q1wMFRdU1tcUEhYy4jFMxQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRD23nNPyx1q4ipXKndiuYDgDC-uZXEGm9-VA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWkV9ctBCpL3ZviWAiJtAIpTPitPaHu-UyWA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIeiMj-lZDoEtabfHGmYYKB31idTT-ELJmdw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGfleBofc7Pc8lF-CGy5OXZTfs-EBp473iHg&s'
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              CarouselSlider(
                items: imgList
                    .map((e) => Center(
                          child: Image.network(e),
                        ))
                    .toList(),
                options: CarouselOptions(
                    initialPage: 0,
                    autoPlay: true,
                    height: 200,
                    autoPlayInterval: const Duration(seconds: 2),
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (value, _) {
                      setState(() {
                        _currentPage = value;
                      });
                    }),
              ),
              buildCarouselInidicator()
            ],
          ),
        ));
  }

  buildCarouselInidicator() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < imgList.length; i++)
            Container(
              margin: EdgeInsets.all(5),
              height: i == _currentPage ? 7 : 5,
              width: i == _currentPage ? 7 : 5,
              decoration: BoxDecoration(
                  color: i == _currentPage ? Colors.black : Colors.grey,
                  shape: BoxShape.circle),
            )
        ],
      ),
    );
  }
}
