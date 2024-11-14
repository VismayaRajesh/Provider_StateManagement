// Import necessary packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Display.dart';
import 'counterprovider.dart';


// Step 4: Implement the main user interface in MyHome widget.
class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    // Step 1: Access the CounterProvider instance to read or watch values.
    final provider = Provider.of<CounterProvider>(context); // Fetch instance of provider.

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the count value using context.watch for real-time updates.
            Text("${context.watch<CounterProvider>().count}"), //Step 2
            // Alternatively, use provider instance (doesn't auto-update if count changes).
            Text("${provider.count}"), //Step 1
            // Navigation button to go to DisplayScreen.
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return DisplayScreen(); // Navigate to DisplayScreen.
                }));
              },
              child: Text("Next"), // Button label.
            ),
          ],
        ),
      ),
      // Floating action button to increment the count.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().increment(); // Increment count.
        },
        child: Text("ADD"), // Button label.
      ),
    );
  }
}

// Explanation of context.read and context.watch:
// context.read: Returns a static, single-read-only value. Use this if the
// value does not need to automatically update in real-time.
// context.watch: Dynamically listens and updates the UI as the value changes.