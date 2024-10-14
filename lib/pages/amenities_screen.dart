import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AmenitiesScreen extends StatefulWidget {
  const AmenitiesScreen({super.key});

  @override
  State<AmenitiesScreen> createState() => _AmenitiesScreenState();
}

class _AmenitiesScreenState extends State<AmenitiesScreen> {
  late VideoPlayerController _controller;
  int likesCount = 120; // Example count for likes
  int commentsCount = 45; // Example count for comments
  int sharesCount = 30; // Example count for shares

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        setState(() {
          _controller.setLooping(true); // Loop the video
          _controller.play(); // Start playing the video automatically
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
                : Container(),
          ),
          Positioned(
            left: 20,
            top: 70,
            child: GestureDetector(
              onTap: ()=>Navigator.pop(context),
              child: Icon(Icons.navigate_before,
                color: Colors.white,


              ),
            ),
          ),
          // Overlay options like Instagram
          Positioned(
            right: 16,
            bottom: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Like Button with Count
                _buildIconWithCount(
                  imagePath: 'assets/images/like.png',
                  count: likesCount,
                  onTap: () {
                    setState(() {
                      likesCount++;
                    });
                  },
                ),
                SizedBox(height: 16), // Increased space between buttons
                // Comment Button with Count
                _buildIconWithCount(
                  imagePath: 'assets/images/comments.png',
                  count: commentsCount,
                  onTap: () {
                    // Add comment action here
                  },
                ),
                SizedBox(height: 16), // Increased space between buttons
                // Share Button with Count
                _buildIconWithCount(
                  imagePath: 'assets/images/share.png',
                  count: sharesCount,
                  onTap: () {
                    // Add share action here
                  },
                ),
                SizedBox(height: 16), // Increased space between buttons
                Text(
                  "10K",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            top: 650,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0), // Optional: add padding around the avatar
                      child: CircleAvatar(
                        radius: 15, // Set the radius of the avatar
                        backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/128/3135/3135715.png', // Replace with your image URL or use AssetImage
                        ),
                      ),
                    ),
                    SizedBox(width: 8), // Space between avatar and text
                    Text(
                      'Manoj Classes', // Replace with the user's name
                      style: TextStyle(
                        fontSize: 18, // Adjust font size as needed
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Make the text bold
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8), // Space between name and button
                Container(
                  width: 256,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF6E5E5E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Learn more",
                          style: TextStyle(color: Colors.white),
                        ),
                        Spacer(),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Worried about admission? Worry no more ....",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build icon with count
  Widget _buildIconWithCount({required String imagePath, required int count, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            imagePath, // Path to your image
            width: 24, // Adjust width as needed
            height: 24, // Adjust height as needed
          ),
          SizedBox(height: 4), // Space between icon and count
          Text(
            '$count',
            style: TextStyle(color: Colors.white), // Ensure text is white
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
