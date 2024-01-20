import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mars_rover_mission/widgets/direction_selector.dart';

class SelectRoverPosition extends StatelessWidget {
  const SelectRoverPosition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.red,
              Colors.redAccent,
              Colors.orange,
              Colors.deepOrange
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                "MARS ROVER",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
              const Text(
                "MISSION",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'X Position',
                  hintText: 'Enter a number between 0 and 199',
                  border: InputBorder.none, // Remove underline
                  labelStyle: TextStyle(
                      color: Colors.white), // Set label text color to white
                  hintStyle: TextStyle(
                      color: Colors.white), // Set hint text color to white
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Set underline color to white
                  ),
                ),
                onChanged: (value) {
                  // Handle Y position change
                },
              ),
              const SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Y Position',
                  hintText: 'Enter a number between 0 and 199',
                  border: InputBorder.none, // Remove underline
                  labelStyle: TextStyle(
                      color: Colors.white), // Set label text color to white
                  hintStyle: TextStyle(
                      color: Colors.white), // Set hint text color to white
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Set underline color to white
                  ),
                ),
                onChanged: (value) {
                  // Handle X position change
                },
              ),
              const SizedBox(height: 16),
              const DirectionSelector(),
            ],
          ),
        ),
      ),
    );
  }
}
