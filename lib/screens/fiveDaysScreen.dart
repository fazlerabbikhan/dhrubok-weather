import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../helper/utils.dart';
import '../provider/weatherProvider.dart';

class FiveDaysScreen extends StatelessWidget {
  static const routeName = '/fiveDaysScreen';

  const FiveDaysScreen({super.key});

  Widget dailyWidget(dynamic weather, BuildContext context) {
    final dayOfWeek = DateFormat('EEEEE').format(weather.date);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                dayOfWeek,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                '${weather.dailyTemp.toStringAsFixed(1)}°',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 15),
                child:
                    MapString.mapStringToIcon(context, weather.condition, 25),
              ),
            ],
          ),
          Divider(color: Colors.black),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context);
    final mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Next 5 Days',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          height: mediaQuery.size.height,
          width: mediaQuery.size.width,
          child: Column(
            children: weatherData.next5Days
                .map((item) => dailyWidget(item, context))
                .toList(),
          ),
        ),
      ),
    );
  }
}
