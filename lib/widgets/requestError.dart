import 'package:flutter/material.dart';
import 'package:dhrubok_weather/provider/weatherProvider.dart';
import 'package:provider/provider.dart';

class RequestError extends StatelessWidget {
  const RequestError({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wrong_location_outlined,
            color: Colors.deepPurple,
            size: 100,
          ),
          const SizedBox(height: 10),
          const Text(
            'No Search Result',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 10),
            child: Text(
              "Please make sure that you entered the correct location or check your device internet connection.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                backgroundColor: Colors.deepPurple),
            child: const Text('Return Home'),
            onPressed: () =>
                Provider.of<WeatherProvider>(context, listen: false)
                    .getWeatherData(isRefresh: true),
          ),
        ],
      ),
    );
  }
}
