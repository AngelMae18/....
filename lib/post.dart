import 'package:flutter/material.dart';

void main() {
  runApp(MoodClickApp());
}

class MoodClickApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostCreationScreen(),
    );
  }
}

class PostCreationScreen extends StatefulWidget {
  @override
  _PostCreationScreenState createState() => _PostCreationScreenState();
}

class _PostCreationScreenState extends State<PostCreationScreen> {
  final TextEditingController _postController = TextEditingController();
  String _selectedMood = 'Select Mood';

  void _postMood() {
    final postText = _postController.text.trim();
    if (postText.isNotEmpty && _selectedMood != 'Select Mood') {
      // Here you would send the post and mood to your backend
      print('Posting: $postText with mood: $_selectedMood');

      // Clear the input after posting
      setState(() {
        _postController.clear();
        _selectedMood = 'Select Mood';
      });
    }
  }

  void _showMoodPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: ListView(
            children: <String>[
              'Happy',
              'Sad',
              'Excited',
              'Angry',
              'Neutral'
            ].map((String mood) {
              return ListTile(
                title: Text(mood),
                onTap: () {
                  setState(() {
                    _selectedMood = mood;
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: Text('Post creation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey[300], // Placeholder for user avatar
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 16),
                Text(
                  'NickName',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: _postController,
              decoration: InputDecoration(
                hintText: 'How you feel today?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _showMoodPicker,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
                  ),
                  child: Text('ADD MOOD'),
                ),
                ElevatedButton(
                  onPressed: _postMood,
                  child: Text('Post'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
