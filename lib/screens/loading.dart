import 'package:flutter/material.dart';
import 'package:weather/data/my_location.dart';
import 'package:weather/data/network.dart';
import 'package:weather/screens/weather_screen.dart';

const String apiKey = '0ede74d30db711b4178a68e848c008e1';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var lat;
  var lon;

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    lat = myLocation.lat;
    lon = myLocation.lon;
    print(lat);
    print(lon);

    NetWork netWork = NetWork(
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric',
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=$lat&lon=$lon&appid=$apiKey');

    var weatherData = await netWork.getJsonData();
    print(weatherData);

    var airData = await netWork.getAirData();
    print(airData);

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return WeatherScreen(
          parseWeatherData: weatherData,
          parseAirPollution: airData,
        );
      },
    ));
  }

  // void fetchData() async {
  //     MyData myData = Mydata();

  //     var myJson = parsingData['weather'][0]['description'];
  //     var myJson2 = parsingData['wind'];

  //     print(myJson);
  //     print(myJson2);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
          },
          child: const Text(
            'Get my Location',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
