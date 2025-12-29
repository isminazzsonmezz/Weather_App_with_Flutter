import 'package:flutter/material.dart';
import 'package:weather_app_with_flutter/api/ApiServiceForWeather.dart';
import 'package:weather_app_with_flutter/model/WeatherModel.dart';
import 'package:weather_app_with_flutter/widgets/custom_appBar_widget.dart';

class MyWeatherHomePage extends StatefulWidget {
  const MyWeatherHomePage({super.key});

  @override
  State<MyWeatherHomePage> createState() => _MyWeatherHomePageState();
}

class _MyWeatherHomePageState extends State<MyWeatherHomePage> {
  ApiServiceWeather weatherApi = ApiServiceWeather();
  Future<WeatherApp>? weatherFuture;

  final List<String> cities = [
    "Ankara",
    "İstanbul",
    "İzmir",
    "Antalya",
    "Bursa",
    "Kayseri",
    "Eskişehir",
    "Trabzon",
  ];
  String selectedTheCity = "";

  void selectedCity(String city) {
    setState(() {
      selectedTheCity = city;
      weatherFuture = weatherApi.fetchUsers(selectedTheCity);
    });
  }

  Icon getWeatherIcon(String iconCode) {
    switch (iconCode) {
      case '01d':
        return const Icon(Icons.wb_sunny, color: Colors.orange);
      case '01n':
        return const Icon(Icons.nightlight_round, color: Colors.indigo);

      case '02d':
      case '02n':
        return const Icon(Icons.cloud_queue, color: Colors.grey);

      case '03d':
      case '03n':
        return const Icon(Icons.cloud, color: Colors.blueGrey);

      case '04d':
      case '04n':
        return const Icon(Icons.cloud_outlined, color: Colors.blueGrey);

      case '09d':
      case '09n':
        return const Icon(Icons.grain, color: Colors.blue);

      case '10d':
      case '10n':
        return const Icon(Icons.umbrella, color: Colors.blueAccent);

      case '11d':
      case '11n':
        return const Icon(Icons.flash_on, color: Colors.deepPurple);

      case '13d':
      case '13n':
        return const Icon(Icons.ac_unit, color: Colors.lightBlue);

      case '50d':
      case '50n':
        return const Icon(Icons.blur_on, color: Colors.grey);

      default:
        return const Icon(Icons.help_outline);
    }
  }

  Card _createCardWidget(WeatherApp weatherData) => Card(
    color: Colors.white54,
    margin: EdgeInsets.all(15),
    child: Padding(
      padding: EdgeInsets.all(15),
      child: Center(
        child: Column(
          children: [
            Text(
              weatherData.name!,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getWeatherIcon(weatherData.weather![0].icon.toString()),
                SizedBox(width: 15),
                Text(
                  weatherData.main!.temp!.round().toString() + "°",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              weatherData.weather![0].description.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.water_drop,
                      color: const Color.fromARGB(255, 78, 169, 243),
                    ),
                    SizedBox(height: 10),
                    Text(weatherData.main!.humidity.toString()),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Icon(
                      Icons.air,
                      color: const Color.fromARGB(255, 78, 169, 243),
                    ),
                    SizedBox(height: 10),
                    Text(weatherData.wind!.speed.toString() + " km/s"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Weather App", showBack: false),
      body: Column(
        children: [
          if (weatherFuture != null)
            FutureBuilder(
              future: weatherFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("An error has occurred"));
                } else {
                  final weatherData = snapshot.data!;

                  return _createCardWidget(weatherData);
                }
              },
            ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: cities.length,
              itemBuilder: (context, index) {
                final isSelected = selectedTheCity == cities[index];
                return GestureDetector(
                  onTap: () => selectedCity(cities[index]),
                  child: Card(
                    color: isSelected
                        ? const Color.fromARGB(255, 144, 200, 245)
                        : Colors.white54,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cities[index],
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.wb_sunny,
                                color: Colors.orangeAccent,
                                size: 32,
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.cloud, color: Colors.blueGrey),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
