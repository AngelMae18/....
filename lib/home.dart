import 'package:flutter/material.dart';

void main() {
  runApp(MoodClickApp());
}

class MoodClickApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug ribbon
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Add navigation drawer or other actions
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add notification action
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Add more options
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'How you feel today?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  MoodCard(
                    nickname: "JohnDoe",
                    mood: "Happy",
                    rate: 80,
                    dateTime: "7 May at 19:18",
                    description: "Feeling great and full of energy!",
                    cares: 109,
                  ),
                  MoodCard(
                    nickname: "JaneDoe",
                    mood: "Sad",
                    rate: 30,
                    dateTime: "7 May at 19:18",
                    description: "Had a tough day, feeling down.",
                    cares: 75,
                  ),
                  MoodCard(
                    nickname: "User123",
                    mood: "Angry",
                    rate: 60,
                    dateTime: "7 May at 19:18",
                    description: "Upset about something that happened.",
                    cares: 50,
                  ),
                  MoodCard(
                    nickname: "User456",
                    mood: "Disappointed",
                    rate: 40,
                    dateTime: "7 May at 19:18",
                    description: "Things didn't go as expected.",
                    cares: 32,
                  ),
                  MoodCard(
                    nickname: "User789",
                    mood: "Scared",
                    rate: 50,
                    dateTime: "7 May at 19:18",
                    description: "Feeling anxious about an upcoming event.",
                    cares: 90,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoodCard extends StatefulWidget {
  final String nickname;
  final String mood;
  final int rate;
  final String dateTime;
  final String description;
  int cares;

  MoodCard({
    required this.nickname,
    required this.mood,
    required this.rate,
    required this.dateTime,
    required this.description,
    required this.cares,
  });

  @override
  _MoodCardState createState() => _MoodCardState();
}

class _MoodCardState extends State<MoodCard> {
  void _incrementCares() {
    setState(() {
      widget.cares += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.nickname} - ${widget.mood} (${widget.rate}%)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              widget.dateTime,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(widget.description),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${widget.cares} Cares'),
                ElevatedButton.icon(
                  onPressed: _incrementCares,
                  icon: Icon(Icons.favorite),
                  label: Text('Care'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
