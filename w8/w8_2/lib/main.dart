import 'package:flutter/material.dart';
import 'package:w8_2/data_classes/weather_data/weather_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:w8_2/screens/search_screen.dart';
import 'package:w8_2/util/open_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<WeatherData>? weatherData;
  String? cityName;
  @override
  void initState() {
    super.initState();
    weatherData = OpenWeather.fetchWeatherDataFromCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather Report')),
      body: Column(
        children: [
          FutureBuilder(
            future: weatherData,
            builder: (context, AsyncSnapshot<WeatherData> snapshot) {
              List<Widget> children = [];
              if (snapshot.hasData) {
                var iconID = snapshot.data!.weather!.first.icon.toString();
                children.add(
                  CachedNetworkImage(
                    imageUrl: 'http://openweathermap.org/img/wn/$iconID@2x.png',
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                );
                children
                    .add(Text(snapshot.data!.weather!.first.main.toString()));
                children.add(Text(snapshot.data!.name.toString()));
              } else if (snapshot.hasError) {
                children.add(const Text('Error'));
              } else {
                children.add(const Text('Wating . . .'));
              }
              return Column(children: children);
            },
          ),
          TextButton(
              onPressed: () async {
                cityName = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()));
                if (cityName != null) {
                  weatherData =
                      OpenWeather.fetchWeatherDataFromCity(cityName: cityName);
                  setState(() {});
                }
              },
              child: const Text('Search'))
        ],
      ),
    );
  }
}
