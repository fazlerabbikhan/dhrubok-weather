import 'package:flutter/material.dart';
import 'package:dhrubok_weather/provider/weatherProvider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../helper/utils.dart';

class FiveDaysForecast extends StatelessWidget {
  const FiveDaysForecast({super.key});

  Widget dailyWidget(dynamic weather, BuildContext context) {
    final dayOfWeek = DateFormat('EEE').format(weather.date);
    final currentTime = weather.date;
    final hours = DateFormat.Hm().format(currentTime);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        children: [
          FittedBox(
            child: Text(
              dayOfWeek,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 20),
            child:
                MapString.mapStringToIcon(context, '${weather.condition}', 35),
          ),
          Text(hours),
          Text(
            '${weather.condition}',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15.0, left: 20.0),
          child: Text(
            'Next 5 Days',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15.0),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            child: ListView(
              padding: const EdgeInsets.all(25.0),
              shrinkWrap: true,
              children: [
                Consumer<WeatherProvider>(builder: (context, weatherProv, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Today',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            '${weatherProv.weather.temp.toStringAsFixed(1)}°',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          MapString.mapInputToWeather(
                            context,
                            weatherProv.weather.currently,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: MapString.mapStringToIcon(
                          context,
                          weatherProv.weather.currently,
                          45,
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 15),
                Consumer<WeatherProvider>(builder: (context, weatherProv, _) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: weatherProv.next5Days
                          .map((item) => dailyWidget(item, context))
                          .toList(),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
