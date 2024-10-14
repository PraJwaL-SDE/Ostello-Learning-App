import 'package:flutter/material.dart';
import 'package:ostello_assignment/pages/amenities_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();

  late PageController _pageController;
  int _currentIndex = 0;
  List<String> filterOption = [
    "Verified",
    "Subjects",
    "Rating"
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "12th IIT JEE",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.navigate_next),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: searchBar(), // This expands the search bar to take up available space
                  ),
                  SizedBox(width: 10), // Adds space between the search bar and button
                  ElevatedButton(
          
                    onPressed: () {
                      // Your button action here
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 45), // Width: 90, Height: 30
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Border radius 10
                      ),
                      elevation: 0, // Removes the elevation
                      backgroundColor: Color(0xFF7D23E0), // Sets the background color to #7D23E0
                    ),
                    child: Text(
                        'Study',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                optionCards('assets/images/carrer_trends.png', "Career Trends"),
                  optionCards('assets/images/assessment.png', "Assessment"),
                  optionCards('assets/images/popular_skill.png', "Popular Skills")
          
          
              ],),
              imageSlider(),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  recommendedVideoThumbnail("assets/images/thumb1.png","Manoj Classes","Maths - 10th", "2.5M"),

                  recommendedVideoThumbnail("assets/images/thumb2.png","Manoj Classes","Maths - 10th", "2.5M"),
                  recommendedVideoThumbnail("assets/images/thumb3.png","Manoj Classes","Maths - 10th", "2.5M")
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Find the best Coach to help you with your 10th Class",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF696969)
                  ),

                ),
              ),

              Row(
                children: [
                  customFilter(),
                  SizedBox(width: 8), // Add space between custom filter and ListView
                  Expanded( // Allow the ListView to take available space
                    child: Container(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: filterOption.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 8), // Space between filter options
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12), // Padding for better appearance
                            alignment: Alignment.center, // Center text in the container
                            child: Text(
                              filterOption[index],
                              style: TextStyle(color: Colors.black), // Change text color if needed
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              // Image.asset('assets/images/physics_video_option.png'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Ongoing Classes",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black
                    ),

                  ),
                ),
              ),

              videoViewCard('assets/images/video_thumbnail_1.png', 'assets/images/avatar_video_1.png', 'Physics - 10th Class', 'Faculty Name', '476K', '3 days ', ((47*60) + 8)),
              searchListViewCard('assets/images/video_thumbnail_1.png', 'assets/images/avatar_video_1.png', 'Physics - 10th Class', 'Faculty Name', '476K', '3 days', ((47*60) + 8))

            ],
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search here...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.blue),
            onPressed: () {
              // Add search functionality here
            },
          ),


        ],
      ),

    );
  }
  Widget optionCards(String imagePath, String title) {
    return Card(
      elevation: 5, // Gives the card a slight shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      color: Colors.white, // Background color white
      child: SizedBox(
        width: 113, // Set the width
        height: 137, // Set the height
        child: Padding(
          padding: const EdgeInsets.all(2.0), // Optional padding inside the card
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centers the content
            children: [
              Image.asset(
                imagePath,
                width: 93, // Adjust the width of the image
                height: 94, // Adjust the height of the image
                fit: BoxFit.cover, // Ensures the image fits within the dimensions
              ),
              SizedBox(height: 5), // Space between image and title
              Text(
                title,
                style: TextStyle(
                  fontSize: 12, // Font size for title
                  fontWeight: FontWeight.bold, // Bold text
                  color: Colors.black, // Optional: change text color
                ),
                textAlign: TextAlign.center, // Center the text
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageSlider() {
    final List<String> imgList = [
      'assets/images/slider_image.png',
      'assets/images/slider_image.png',
      'assets/images/slider_image.png',
    ];


    return Column(
      children: [
        Container(
          height: 120, // Height of the slider
          child: PageView.builder(
            controller: _pageController,
            itemCount: imgList.length,
            itemBuilder: (context, index) {
              return Image.asset(
                imgList[index],
                fit: BoxFit.fill,
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        // Indicator dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(imgList.length, (index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              height: 8.0,
              width: _currentIndex == index ? 24.0 : 8.0,
              decoration: BoxDecoration(
                color: _currentIndex == index ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget recommendedVideoThumbnail(String imagePath, String title, String subtitle, String views) {
    return GestureDetector(
      onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>AmenitiesScreen())),
      child: Container(
        height: 175,
        width: 113,
        child: Stack(
          children: [
            Image.asset(imagePath),
            Positioned(
              top: 10,
              left: 10,

              child: Row(
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.white, // Change icon color to white
                  ),
                  SizedBox(width: 4), // Optional space between icon and text
                  Text(
                    views,
                    style: TextStyle(color: Colors.white), // Change text color to white
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ), // Change title color to white
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.white,
                        fontSize: 10
                    ), // Change subtitle color to white
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customFilter(){
    return Container(
      height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
      child: Row(
        children: [
          Container(
            height: 25,
              child: Image.asset("assets/images/filter.png")),
          Text("Filters"),
          Icon(Icons.arrow_drop_down_sharp,
          )
        ],
      ),
    );
  }

  Widget videoViewCard(
      String thumbPath,
      String avatarPath,
      String videoTitle,
      String facultyName,
      String videoViews,
      String videoTime,
      int videoDurationSec
      ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8), // Add vertical padding for separation
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start
        children: [
          // Video thumbnail with duration overlay
          Stack(
            children: [
              Image.asset(thumbPath), // Thumbnail image
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  color: Colors.black.withOpacity(0.7),
                  child: Text(
                    _formatDuration(videoDurationSec),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8), // Spacing between image and details
          // Video info: avatar, title, and description
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              CircleAvatar(
                backgroundImage: AssetImage(avatarPath),
                radius: 20, // Avatar size
              ),
              SizedBox(width: 10), // Spacing between avatar and text
              // Video details: title, faculty, views
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      videoTitle,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis, // Handle long titles
                    ),
                    SizedBox(height: 4),
                    Text(
                      facultyName,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          "$videoViews views",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.circle, size: 4, color: Colors.grey[600]),
                        SizedBox(width: 5),
                        Text(
                          "$videoTime ago",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_vert), // Menu icon
            ],
          ),
        ],
      ),
    );
  }

// Helper function to format the video duration
  String _formatDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  Widget searchListViewCard(
      String thumbPath,
      String avatarPath,
      String videoTitle,
      String facultyName,
      String videoViews,
      String videoTime,
      int videoDurationSec
      ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 4), // Vertical padding for separation
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top
        children: [
          // Video thumbnail with duration overlay
          Stack(
            children: [
              Container(
                width: 180,
                height: 110,// Set a fixed width for the thumbnail
                child: Image.asset(
                  thumbPath,
                  fit: BoxFit.fill, // Cover the thumbnail image
                ),
              ),
              Positioned(
                bottom: 4,
                right: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  color: Colors.black.withOpacity(0.7), // Semi-transparent black background
                  child: Text(
                    _formatDuration(videoDurationSec),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10), // Spacing between thumbnail and details
          // Video details: title, faculty, views, time
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Video Title and Icon in a Row
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        videoTitle,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis, // Handle long titles
                      ),
                    ),
                    Icon(Icons.more_vert), // Overflow menu icon
                  ],
                ),
                SizedBox(height: 4), // Spacing between title and other details
                // Views and Time
                Row(
                  children: [
                    Text(
                      "$videoViews views",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.circle, size: 4, color: Colors.grey[600]),
                    SizedBox(width: 5),
                    Text(
                      "$videoTime ago",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                // Avatar and Institute Name
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15, // Adjust size of the avatar
                      backgroundImage: AssetImage(avatarPath), // Load avatar image
                    ),
                    SizedBox(width: 8), // Spacing between avatar and text
                    Text(
                      facultyName,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
