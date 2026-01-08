import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "YouTube Clone",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red,
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F0F0F),
          elevation: 0,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

// Model untuk Video
class Video {
  final String id;
  final String title;
  final String channelName;
  final String channelAvatar;
  final String thumbnailUrl;
  final String views;
  final String uploadTime;
  final String duration;
  final bool isLive;

  Video({
    required this.id,
    required this.title,
    required this.channelName,
    required this.channelAvatar,
    required this.thumbnailUrl,
    required this.views,
    required this.uploadTime,
    required this.duration,
    this.isLive = false,
  });
}

// Main Screen dengan Bottom Navigation
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ShortsScreen(),
    const CreateScreen(),
    const SubscriptionsScreen(),
    const LibraryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.2),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF0F0F0F),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline),
              activeIcon: Icon(Icons.play_circle),
              label: 'Shorts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline, size: 40),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined),
              activeIcon: Icon(Icons.subscriptions),
              label: 'Subscriptions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined),
              activeIcon: Icon(Icons.video_library),
              label: 'Library',
            ),
          ],
        ),
      ),
    );
  }
}

// Home Screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    'All',
    'Music',
    'Gaming',
    'News',
    'Live',
    'Podcasts',
    'Comedy',
    'Sports',
    'Learning',
    'Fashion',
  ];

  int selectedCategoryIndex = 0;

  final List<Video> videos = [
    Video(
      id: '1',
      title: 'Flutter Tutorial for Beginners - Build Your First App',
      channelName: 'Flutter Dev',
      channelAvatar: 'https://picsum.photos/seed/channel1/100/100',
      thumbnailUrl: 'https://picsum.photos/seed/video1/640/360',
      views: '1.2M views',
      uploadTime: '2 days ago',
      duration: '15:30',
    ),
    Video(
      id: '2',
      title: 'Top 10 Programming Languages to Learn in 2024',
      channelName: 'Tech World',
      channelAvatar: 'https://picsum.photos/seed/channel2/100/100',
      thumbnailUrl: 'https://picsum.photos/seed/video2/640/360',
      views: '850K views',
      uploadTime: '1 week ago',
      duration: '12:45',
    ),
    Video(
      id: '3',
      title: 'Beautiful Indonesia - Travel Vlog 4K',
      channelName: 'Travel Adventures',
      channelAvatar: 'https://picsum.photos/seed/channel3/100/100',
      thumbnailUrl: 'https://picsum.photos/seed/video3/640/360',
      views: '2.5M views',
      uploadTime: '3 days ago',
      duration: '20:15',
    ),
    Video(
      id: '4',
      title: 'LIVE: Coding Session - Building a YouTube Clone',
      channelName: 'Code Stream',
      channelAvatar: 'https://picsum.photos/seed/channel4/100/100',
      thumbnailUrl: 'https://picsum.photos/seed/video4/640/360',
      views: '15K watching',
      uploadTime: 'Streaming now',
      duration: 'LIVE',
      isLive: true,
    ),
    Video(
      id: '5',
      title: 'Best Lo-Fi Music for Studying and Focus',
      channelName: 'Chill Beats',
      channelAvatar: 'https://picsum.photos/seed/channel5/100/100',
      thumbnailUrl: 'https://picsum.photos/seed/video5/640/360',
      views: '5.8M views',
      uploadTime: '1 month ago',
      duration: '3:45:00',
    ),
    Video(
      id: '6',
      title: 'How to Make Perfect Nasi Goreng - Indonesian Recipe',
      channelName: 'Chef Kitchen',
      channelAvatar: 'https://picsum.photos/seed/channel6/100/100',
      thumbnailUrl: 'https://picsum.photos/seed/video6/640/360',
      views: '320K views',
      uploadTime: '5 days ago',
      duration: '8:22',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            floating: true,
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.play_arrow, color: Colors.white, size: 24),
                ),
                const SizedBox(width: 8),
                const Text(
                  'YouTube',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.cast, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Stack(
                  children: [
                    const Icon(Icons.notifications_outlined, color: Colors.white),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
                        child: const Text(
                          '5',
                          style: TextStyle(color: Colors.white, fontSize: 8),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchScreen()),
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileScreen()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage('https://picsum.photos/seed/user/100/100'),
                  ),
                ),
              ),
            ],
          ),

          // Categories
          SliverToBoxAdapter(
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FilterChip(
                      label: Text(categories[index]),
                      selected: selectedCategoryIndex == index,
                      onSelected: (selected) {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                      backgroundColor: const Color(0xFF272727),
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selectedCategoryIndex == index ? Colors.black : Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Video List
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return VideoCard(video: videos[index]);
              },
              childCount: videos.length,
            ),
          ),
        ],
      ),
    );
  }
}

// Video Card Widget
class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(video: video),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    video.thumbnailUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[800],
                        child: const Center(
                          child: Icon(Icons.error, color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
                // Duration Badge
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: video.isLive ? Colors.red : Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      video.duration,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Video Info
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(video.channelAvatar),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          video.title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              video.channelName,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[400],
                              ),
                            ),
                            if (video.channelName == 'Flutter Dev') ...[
                              const SizedBox(width: 4),
                              Icon(Icons.check_circle, size: 12, color: Colors.grey[400]),
                            ],
                          ],
                        ),
                        Text(
                          '${video.views} • ${video.uploadTime}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {
                      _showVideoOptions(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showVideoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF212121),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildOptionTile(Icons.access_time, 'Save to Watch later'),
              _buildOptionTile(Icons.playlist_add, 'Save to playlist'),
              _buildOptionTile(Icons.download_outlined, 'Download video'),
              _buildOptionTile(Icons.share_outlined, 'Share'),
              _buildOptionTile(Icons.not_interested, 'Not interested'),
              _buildOptionTile(Icons.block, 'Don\'t recommend channel'),
              _buildOptionTile(Icons.flag_outlined, 'Report'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOptionTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {},
    );
  }
}

// Video Player Screen
class VideoPlayerScreen extends StatefulWidget {
  final Video video;

  const VideoPlayerScreen({super.key, required this.video});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  bool isLiked = false;
  bool isDisliked = false;
  bool isSubscribed = false;
  final TextEditingController _commentController = TextEditingController();

  final List<Map<String, String>> comments = [
    {
      'user': 'John Doe',
      'avatar': 'https://picsum.photos/seed/user1/100/100',
      'comment': 'Great tutorial! Very helpful for beginners.',
      'likes': '1.2K',
      'time': '2 hours ago',
    },
    {
      'user': 'Jane Smith',
      'avatar': 'https://picsum.photos/seed/user2/100/100',
      'comment': 'Thanks for sharing this! Looking forward to more content.',
      'likes': '856',
      'time': '5 hours ago',
    },
    {
      'user': 'Tech Enthusiast',
      'avatar': 'https://picsum.photos/seed/user3/100/100',
      'comment': 'This is exactly what I was looking for! 🔥',
      'likes': '2.1K',
      'time': '1 day ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: Column(
          children: [
            // Video Player Area
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.black,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          widget.video.thumbnailUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.3),
                        ),
                        const Icon(
                          Icons.play_circle_filled,
                          size: 64,
                          color: Colors.white,
                        ),
                        // Video Controls Overlay
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              // Progress Bar
                              LinearProgressIndicator(
                                value: 0.3,
                                backgroundColor: Colors.grey[800],
                                valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '4:32 / 15:30',
                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.settings, color: Colors.white, size: 20),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.fullscreen, color: Colors.white, size: 20),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Back Button
                        Positioned(
                          top: 8,
                          left: 8,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            
            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and Info
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.video.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${widget.video.views} • ${widget.video.uploadTime}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Action Buttons
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          _buildActionButton(
                            icon: isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                            label: '125K',
                            onTap: () {
                              setState(() {
                                isLiked = !isLiked;
                                if (isLiked) isDisliked = false;
                              });
                            },
                            isActive: isLiked,
                          ),
                          _buildActionButton(
                            icon: isDisliked ? Icons.thumb_down : Icons.thumb_down_outlined,
                            label: 'Dislike',
                            onTap: () {
                              setState(() {
                                isDisliked = !isDisliked;
                                if (isDisliked) isLiked = false;
                              });
                            },
                            isActive: isDisliked,
                          ),
                          _buildActionButton(
                            icon: Icons.share,
                            label: 'Share',
                            onTap: () {},
                          ),
                          _buildActionButton(
                            icon: Icons.download,
                            label: 'Download',
                            onTap: () {},
                          ),
                          _buildActionButton(
                            icon: Icons.playlist_add,
                            label: 'Save',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    const Divider(color: Colors.grey, height: 24),

                    // Channel Info
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage(widget.video.channelAvatar),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      widget.video.channelName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Icon(Icons.check_circle, size: 14, color: Colors.grey[400]),
                                  ],
                                ),
                                Text(
                                  '1.5M subscribers',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isSubscribed = !isSubscribed;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isSubscribed ? Colors.grey[800] : Colors.white,
                              foregroundColor: isSubscribed ? Colors.white : Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(isSubscribed ? 'Subscribed' : 'Subscribe'),
                          ),
                        ],
                      ),
                    ),

                    const Divider(color: Colors.grey, height: 24),

                    // Comments Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          const Text(
                            'Comments',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${comments.length}K',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Add Comment
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage('https://picsum.photos/seed/user/100/100'),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              controller: _commentController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Add a comment...',
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                border: const UnderlineInputBorder(),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[600]!),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Comments List
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        final comment = comments[index];
                        return _buildCommentTile(comment);
                      },
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF272727),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(icon, color: isActive ? Colors.blue : Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: isActive ? Colors.blue : Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommentTile(Map<String, String> comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(comment['avatar']!),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment['user']!,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      comment['time']!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  comment['comment']!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.thumb_up_outlined, size: 16, color: Colors.white),
                    const SizedBox(width: 8),
                    Text(
                      comment['likes']!,
                      style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.thumb_down_outlined, size: 16, color: Colors.white),
                    const SizedBox(width: 24),
                    Text(
                      'Reply',
                      style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white, size: 18),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// Shorts Screen
class ShortsScreen extends StatelessWidget {
  const ShortsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> shorts = [
      {
        'thumbnail': 'https://picsum.photos/seed/short1/400/700',
        'title': 'Amazing Flutter Animation! 🔥',
        'channel': 'Flutter Tips',
        'likes': '45K',
        'comments': '1.2K',
      },
      {
        'thumbnail': 'https://picsum.photos/seed/short2/400/700',
        'title': 'Quick coding tip for beginners',
        'channel': 'Code Master',
        'likes': '89K',
        'comments': '3.4K',
      },
      {
        'thumbnail': 'https://picsum.photos/seed/short3/400/700',
        'title': 'Indonesia travel vlog 🇮🇩',
        'channel': 'Travel Daily',
        'likes': '120K',
        'comments': '5.6K',
      },
    ];

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: shorts.length,
      itemBuilder: (context, index) {
        final short = shorts[index];
        return Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.network(
              short['thumbnail'],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[900],
                  child: const Center(child: Icon(Icons.error, color: Colors.white)),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
            // Content
            Positioned(
              right: 12,
              bottom: 100,
              child: Column(
                children: [
                  _buildShortAction(Icons.thumb_up, short['likes']),
                  const SizedBox(height: 20),
                  _buildShortAction(Icons.thumb_down_outlined, 'Dislike'),
                  const SizedBox(height: 20),
                  _buildShortAction(Icons.comment, short['comments']),
                  const SizedBox(height: 20),
                  _buildShortAction(Icons.share, 'Share'),
                  const SizedBox(height: 20),
                  _buildShortAction(Icons.more_vert, ''),
                ],
              ),
            ),
            // Video Info
            Positioned(
              left: 12,
              right: 60,
              bottom: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage('https://picsum.photos/seed/shortchannel/100/100'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        short['channel'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Subscribe',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    short['title'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildShortAction(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        if (label.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ],
    );
  }
}

// Create Screen (Upload)
class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        title: const Text('Create', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCreateOption(Icons.upload_file, 'Upload a video', Colors.red),
            const SizedBox(height: 20),
            _buildCreateOption(Icons.live_tv, 'Go live', Colors.red),
            const SizedBox(height: 20),
            _buildCreateOption(Icons.slow_motion_video, 'Create a Short', Colors.red),
            const SizedBox(height: 20),
            _buildCreateOption(Icons.post_add, 'Create a post', Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateOption(IconData icon, String label, Color color) {
    return Container(
      width: 280,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF272727),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// Subscriptions Screen
class SubscriptionsScreen extends StatelessWidget {
  const SubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> channels = [
      {'name': 'Flutter Dev', 'avatar': 'https://picsum.photos/seed/sub1/100/100'},
      {'name': 'Tech World', 'avatar': 'https://picsum.photos/seed/sub2/100/100'},
      {'name': 'Code Master', 'avatar': 'https://picsum.photos/seed/sub3/100/100'},
      {'name': 'Travel Vlog', 'avatar': 'https://picsum.photos/seed/sub4/100/100'},
      {'name': 'Music Channel', 'avatar': 'https://picsum.photos/seed/sub5/100/100'},
    ];

    final List<Video> subVideos = [
      Video(
        id: '1',
        title: 'New Flutter 3.0 Features Explained',
        channelName: 'Flutter Dev',
        channelAvatar: 'https://picsum.photos/seed/sub1/100/100',
        thumbnailUrl: 'https://picsum.photos/seed/subvid1/640/360',
        views: '50K views',
        uploadTime: '2 hours ago',
        duration: '18:45',
      ),
      Video(
        id: '2',
        title: 'Why You Should Learn Dart in 2024',
        channelName: 'Tech World',
        channelAvatar: 'https://picsum.photos/seed/sub2/100/100',
        thumbnailUrl: 'https://picsum.photos/seed/subvid2/640/360',
        views: '120K views',
        uploadTime: '5 hours ago',
        duration: '12:30',
      ),
    ];

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: const Text('Subscriptions', style: TextStyle(color: Colors.white)),
            backgroundColor: const Color(0xFF0F0F0F),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          // Subscribed Channels
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: channels.length + 1,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  if (index == channels.length) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey[800],
                            child: const Icon(Icons.keyboard_arrow_right, color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'All',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(channels[index]['avatar']!),
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: 60,
                          child: Text(
                            channels[index]['name']!,
                            style: const TextStyle(color: Colors.white, fontSize: 11),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(color: Colors.grey, height: 1),
          ),
          // Subscription Videos
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => VideoCard(video: subVideos[index]),
              childCount: subVideos.length,
            ),
          ),
        ],
      ),
    );
  }
}

// Library Screen
class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundImage: NetworkImage('https://picsum.photos/seed/user/100/100'),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User Name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '@username',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'View channel',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(color: Colors.grey, height: 1),

            // History Section
            _buildSection(
              icon: Icons.history,
              title: 'History',
              trailing: 'View all',
              onTap: () {},
            ),

            // Playlists
            _buildSection(
              icon: Icons.playlist_play,
              title: 'Playlists',
              trailing: '',
              onTap: () {},
            ),

            // Your videos
            _buildSection(
              icon: Icons.video_library,
              title: 'Your videos',
              trailing: '',
              onTap: () {},
            ),

            // Downloads
            _buildSection(
              icon: Icons.download,
              title: 'Downloads',
              trailing: '3 videos',
              onTap: () {},
            ),

            // Watch later
            _buildSection(
              icon: Icons.access_time,
              title: 'Watch later',
              trailing: '12 videos',
              onTap: () {},
            ),

            // Liked videos
            _buildSection(
              icon: Icons.thumb_up,
              title: 'Liked videos',
              trailing: '256 videos',
              onTap: () {},
            ),

            const Divider(color: Colors.grey, height: 1),

            // Quick Actions
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildQuickAction(Icons.settings, 'Settings'),
                  _buildQuickAction(Icons.help_outline, 'Help'),
                  _buildQuickAction(Icons.feedback_outlined, 'Feedback'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required String trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailing.isNotEmpty)
            Text(trailing, style: const TextStyle(color: Colors.grey)),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _buildQuickAction(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

// Search Screen
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> searchHistory = [
    'Flutter tutorial',
    'Dart programming',
    'Mobile development',
    'UI design tips',
  ];

  List<String> suggestions = [
    'flutter widgets explained',
    'flutter state management',
    'flutter animations',
    'flutter firebase',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          controller: _searchController,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search YouTube',
            hintStyle: TextStyle(color: Colors.grey[400]),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {});
          },
        ),
        actions: [
          if (_searchController.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear, color: Colors.white),
              onPressed: () {
                _searchController.clear();
                setState(() {});
              },
            ),
          IconButton(
            icon: const Icon(Icons.mic, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search History
          if (_searchController.text.isEmpty) ...[
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Recent searches',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            ...searchHistory.map((item) => ListTile(
                  leading: const Icon(Icons.history, color: Colors.grey),
                  title: Text(item, style: const TextStyle(color: Colors.white)),
                  trailing: IconButton(
                    icon: const Icon(Icons.north_west, color: Colors.grey),
                    onPressed: () {
                      _searchController.text = item;
                      setState(() {});
                    },
                  ),
                  onTap: () {
                    _searchController.text = item;
                    setState(() {});
                  },
                )),
          ] else ...[
            // Suggestions
            ...suggestions
                .where((s) => s.toLowerCase().contains(_searchController.text.toLowerCase()))
                .map((item) => ListTile(
                      leading: const Icon(Icons.search, color: Colors.grey),
                      title: Text(item, style: const TextStyle(color: Colors.white)),
                      trailing: IconButton(
                        icon: const Icon(Icons.north_west, color: Colors.grey),
                        onPressed: () {
                          _searchController.text = item;
                          setState(() {});
                        },
                      ),
                      onTap: () {
                        _searchController.text = item;
                        setState(() {});
                      },
                    )),
          ],
        ],
      ),
    );
  }
}

// Notifications Screen
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<Map<String, dynamic>> notifications = [
    {
      'type': 'video',
      'channel': 'Flutter Dev',
      'avatar': 'https://picsum.photos/seed/notif1/100/100',
      'thumbnail': 'https://picsum.photos/seed/notifvid1/120/68',
      'message': 'uploaded: New Flutter 4.0 Features Explained',
      'time': '2 hours ago',
      'isRead': false,
    },
    {
      'type': 'live',
      'channel': 'Code Stream',
      'avatar': 'https://picsum.photos/seed/notif2/100/100',
      'thumbnail': 'https://picsum.photos/seed/notifvid2/120/68',
      'message': 'is live: Coding Session - Building Apps',
      'time': '3 hours ago',
      'isRead': false,
    },
    {
      'type': 'comment',
      'channel': 'John Doe',
      'avatar': 'https://picsum.photos/seed/notif3/100/100',
      'thumbnail': 'https://picsum.photos/seed/notifvid3/120/68',
      'message': 'replied to your comment: "Great tutorial!"',
      'time': '5 hours ago',
      'isRead': true,
    },
    {
      'type': 'like',
      'channel': 'Tech World',
      'avatar': 'https://picsum.photos/seed/notif4/100/100',
      'thumbnail': 'https://picsum.photos/seed/notifvid4/120/68',
      'message': 'liked your comment on "Top 10 Languages"',
      'time': '1 day ago',
      'isRead': true,
    },
    {
      'type': 'subscriber',
      'channel': 'New User 123',
      'avatar': 'https://picsum.photos/seed/notif5/100/100',
      'thumbnail': null,
      'message': 'subscribed to your channel',
      'time': '2 days ago',
      'isRead': true,
    },
    {
      'type': 'video',
      'channel': 'Travel Adventures',
      'avatar': 'https://picsum.photos/seed/notif6/100/100',
      'thumbnail': 'https://picsum.photos/seed/notifvid6/120/68',
      'message': 'uploaded: Beautiful Bali 4K',
      'time': '3 days ago',
      'isRead': true,
    },
    {
      'type': 'recommendation',
      'channel': 'YouTube',
      'avatar': 'https://picsum.photos/seed/notif7/100/100',
      'thumbnail': 'https://picsum.photos/seed/notifvid7/120/68',
      'message': 'Recommended for you: Learn Dart in 1 Hour',
      'time': '1 week ago',
      'isRead': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Notifications', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              _showNotificationSettings(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return _buildNotificationTile(notif, index);
        },
      ),
    );
  }

  Widget _buildNotificationTile(Map<String, dynamic> notif, int index) {
    return Container(
      color: notif['isRead'] ? Colors.transparent : const Color(0xFF1A1A2E),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(notif['avatar']),
            ),
            if (notif['type'] == 'live')
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'LIVE',
                    style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
        title: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 14, color: Colors.white),
            children: [
              TextSpan(
                text: notif['channel'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextSpan(text: ' '),
              TextSpan(
                text: notif['message'],
                style: TextStyle(color: Colors.grey[300]),
              ),
            ],
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            notif['time'],
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (notif['thumbnail'] != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  notif['thumbnail'],
                  width: 80,
                  height: 45,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 80,
                    height: 45,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.grey, size: 20),
              onPressed: () {
                _showNotificationOptions(context, index);
              },
            ),
          ],
        ),
        onTap: () {
          setState(() {
            notifications[index]['isRead'] = true;
          });
        },
      ),
    );
  }

  void _showNotificationOptions(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF212121),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.visibility_off, color: Colors.white),
                title: const Text('Hide this notification', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    notifications.removeAt(index);
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications_off, color: Colors.white),
                title: Text('Turn off notifications from ${notifications[index]['channel']}',
                    style: const TextStyle(color: Colors.white)),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.flag_outlined, color: Colors.white),
                title: const Text('Report', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showNotificationSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF212121),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.done_all, color: Colors.white),
                title: const Text('Mark all as read', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    for (var notif in notifications) {
                      notif['isRead'] = true;
                    }
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text('Notification settings', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotificationSettingsScreen()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

// Notification Settings Screen
class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool subscriptions = true;
  bool recommendedVideos = true;
  bool activityOnChannel = true;
  bool activityOnComments = true;
  bool mentions = true;
  bool sharedContent = false;
  bool productUpdates = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Notification settings', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'General',
              style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          _buildSwitchTile(
            'Subscriptions',
            'Notify me about activity from channels I\'m subscribed to',
            subscriptions,
            (value) => setState(() => subscriptions = value),
          ),
          _buildSwitchTile(
            'Recommended videos',
            'Notify me of videos I might like based on what I watch',
            recommendedVideos,
            (value) => setState(() => recommendedVideos = value),
          ),
          _buildSwitchTile(
            'Activity on my channel',
            'Notify me about comments and other activity on my channel',
            activityOnChannel,
            (value) => setState(() => activityOnChannel = value),
          ),
          _buildSwitchTile(
            'Activity on my comments',
            'Notify me about activity on my comments on other channels',
            activityOnComments,
            (value) => setState(() => activityOnComments = value),
          ),
          _buildSwitchTile(
            'Mentions',
            'Notify me when others mention my channel',
            mentions,
            (value) => setState(() => mentions = value),
          ),
          _buildSwitchTile(
            'Shared content',
            'Notify me when others share my content',
            sharedContent,
            (value) => setState(() => sharedContent = value),
          ),
          const Divider(color: Colors.grey),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Email notifications',
              style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          _buildSwitchTile(
            'Product updates and announcements',
            'Send emails about new features and product updates',
            productUpdates,
            (value) => setState(() => productUpdates = value),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[400], fontSize: 12)),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.blue,
    );
  }
}

// Profile Screen
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = true;
  bool isRestrictedMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://picsum.photos/seed/user/200/200'),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Muhammad Rizky',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '@muhammadrizky',
                        style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '•',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'View channel',
                        style: TextStyle(color: Colors.blue[400], fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Account switcher
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF272727),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage('https://picsum.photos/seed/user/100/100'),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Muhammad Rizky',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'muhammadrizky@gmail.com',
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Divider(color: Colors.grey, height: 1),

            // Google Account
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person_outline, color: Colors.white),
              ),
              title: const Text('Manage your Google Account', style: TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.open_in_new, color: Colors.grey, size: 20),
              onTap: () {},
            ),

            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.switch_account_outlined, color: Colors.white),
              ),
              title: const Text('Switch account', style: TextStyle(color: Colors.white)),
              onTap: () {
                _showAccountSwitcher(context);
              },
            ),

            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.account_circle_outlined, color: Colors.white),
              ),
              title: const Text('Turn on Incognito', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),

            const Divider(color: Colors.grey, height: 1),

            // YouTube features
            ListTile(
              leading: const Icon(Icons.movie_outlined, color: Colors.white),
              title: const Text('Your channel', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const YourChannelScreen()),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.monetization_on_outlined, color: Colors.white),
              title: const Text('Get YouTube Premium', style: TextStyle(color: Colors.white)),
              subtitle: Text('Ad-free videos, background play, and more', 
                style: TextStyle(color: Colors.grey[400], fontSize: 12)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const YoutubePremiumScreen()),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.play_circle_outline, color: Colors.white),
              title: const Text('Purchases and memberships', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.bar_chart, color: Colors.white),
              title: const Text('Time watched', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TimeWatchedScreen()),
                );
              },
            ),

            const Divider(color: Colors.grey, height: 1),

            // Settings section
            ListTile(
              leading: const Icon(Icons.videocam_outlined, color: Colors.white),
              title: const Text('Your data in YouTube', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),

            SwitchListTile(
              secondary: const Icon(Icons.dark_mode_outlined, color: Colors.white),
              title: const Text('Dark theme', style: TextStyle(color: Colors.white)),
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
              activeColor: Colors.blue,
            ),

            SwitchListTile(
              secondary: const Icon(Icons.shield_outlined, color: Colors.white),
              title: const Text('Restricted Mode', style: TextStyle(color: Colors.white)),
              subtitle: Text('Hide videos that may contain inappropriate content',
                style: TextStyle(color: Colors.grey[400], fontSize: 12)),
              value: isRestrictedMode,
              onChanged: (value) {
                setState(() {
                  isRestrictedMode = value;
                });
              },
              activeColor: Colors.blue,
            ),

            ListTile(
              leading: const Icon(Icons.language, color: Colors.white),
              title: const Text('Location: Indonesia', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),

            const Divider(color: Colors.grey, height: 1),

            // Help & Feedback
            ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.white),
              title: const Text('Help & feedback', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HelpFeedbackScreen()),
                );
              },
            ),

            const SizedBox(height: 20),

            // Footer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Privacy Policy • Terms of Service',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showAccountSwitcher(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF212121),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Accounts',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage('https://picsum.photos/seed/user/100/100'),
                ),
                title: const Text('Muhammad Rizky', style: TextStyle(color: Colors.white)),
                subtitle: Text('muhammadrizky@gmail.com', style: TextStyle(color: Colors.grey[400])),
                trailing: const Icon(Icons.check, color: Colors.blue),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[700],
                  child: const Icon(Icons.add, color: Colors.white),
                ),
                title: const Text('Add account', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[700],
                  child: const Icon(Icons.manage_accounts, color: Colors.white),
                ),
                title: const Text('Manage accounts on this device', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Settings Screen
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: [
          _buildSettingsSection('Account', [
            _buildSettingsTile(Icons.person_outline, 'Manage your Google Account', () {}),
            _buildSettingsTile(Icons.privacy_tip_outlined, 'Privacy', () {}),
            _buildSettingsTile(Icons.history, 'History & privacy', () {}),
          ]),
          _buildSettingsSection('General', [
            _buildSettingsTile(Icons.notifications_outlined, 'Notifications', () {}),
            _buildSettingsTile(Icons.play_circle_outline, 'Playback', () {}),
            _buildSettingsTile(Icons.download_outlined, 'Downloads', () {}),
            _buildSettingsTile(Icons.data_usage, 'Data saving', () {}),
          ]),
          _buildSettingsSection('Video quality preferences', [
            _buildSettingsTile(Icons.wifi, 'Video quality on Wi-Fi', () {}, subtitle: 'Auto (recommended)'),
            _buildSettingsTile(Icons.signal_cellular_alt, 'Video quality on mobile networks', () {}, subtitle: 'Auto (recommended)'),
          ]),
          _buildSettingsSection('Accessibility', [
            _buildSettingsTile(Icons.closed_caption_outlined, 'Captions', () {}),
            _buildSettingsTile(Icons.accessibility_new, 'Accessibility player', () {}),
          ]),
          _buildSettingsSection('About', [
            _buildSettingsTile(Icons.info_outline, 'About YouTube', () {}, subtitle: 'Version 19.08.36'),
            _buildSettingsTile(Icons.help_outline, 'Help', () {}),
            _buildSettingsTile(Icons.feedback_outlined, 'Send feedback', () {}),
          ]),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: const TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        ...children,
        const Divider(color: Colors.grey, height: 1),
      ],
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, VoidCallback onTap, {String? subtitle}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: subtitle != null 
        ? Text(subtitle, style: TextStyle(color: Colors.grey[400], fontSize: 12))
        : null,
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}

// Your Channel Screen
class YourChannelScreen extends StatelessWidget {
  const YourChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: const Color(0xFF0F0F0F),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(icon: const Icon(Icons.cast, color: Colors.white), onPressed: () {}),
              IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
              IconButton(icon: const Icon(Icons.more_vert, color: Colors.white), onPressed: () {}),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://picsum.photos/seed/banner/800/200',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(color: Colors.blue[800]),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage('https://picsum.photos/seed/user/200/200'),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'Muhammad Rizky',
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 4),
                                Icon(Icons.check_circle, color: Colors.grey, size: 16),
                              ],
                            ),
                            Text('@muhammadrizky', style: TextStyle(color: Colors.grey[400])),
                            const SizedBox(height: 4),
                            Text(
                              '1.5K subscribers • 25 videos',
                              style: TextStyle(color: Colors.grey[400], fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Welcome to my channel! Here I share tutorials about Flutter, Dart, and mobile development.',
                    style: TextStyle(color: Colors.grey[300], fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.link, color: Colors.blue, size: 16),
                        label: const Text('github.com/muhammadrizky', style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          child: const Text('Customize channel', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          child: const Text('Manage videos', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  const TabBar(
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(text: 'Home'),
                      Tab(text: 'Videos'),
                      Tab(text: 'Shorts'),
                      Tab(text: 'Playlists'),
                    ],
                  ),
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      children: [
                        _buildChannelVideos(),
                        _buildChannelVideos(),
                        _buildChannelShorts(),
                        _buildChannelPlaylists(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChannelVideos() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  'https://picsum.photos/seed/myvid$index/320/180',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'My Flutter Tutorial',
              style: TextStyle(color: Colors.white, fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '1.2K views • 2 days ago',
              style: TextStyle(color: Colors.grey[400], fontSize: 10),
            ),
          ],
        );
      },
    );
  }

  Widget _buildChannelShorts() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            'https://picsum.photos/seed/myshort$index/200/350',
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  Widget _buildChannelPlaylists() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          color: const Color(0xFF272727),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                'https://picsum.photos/seed/playlist$index/120/68',
                width: 120,
                height: 68,
                fit: BoxFit.cover,
              ),
            ),
            title: const Text('My Playlist', style: TextStyle(color: Colors.white)),
            subtitle: Text('5 videos', style: TextStyle(color: Colors.grey[400])),
          ),
        );
      },
    );
  }
}

// Time Watched Screen
class TimeWatchedScreen extends StatelessWidget {
  const TimeWatchedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Time watched', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Weekly Stats
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF272727),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text(
                    'This week',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '12h 45m',
                    style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn('Today', '2h 15m'),
                      Container(width: 1, height: 40, color: Colors.grey),
                      _buildStatColumn('Yesterday', '3h 30m'),
                      Container(width: 1, height: 40, color: Colors.grey),
                      _buildStatColumn('Daily avg', '1h 49m'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Daily breakdown chart placeholder
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF272727),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daily breakdown',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildBarChart('Sun', 0.3),
                        _buildBarChart('Mon', 0.5),
                        _buildBarChart('Tue', 0.8),
                        _buildBarChart('Wed', 0.4),
                        _buildBarChart('Thu', 0.6),
                        _buildBarChart('Fri', 0.9),
                        _buildBarChart('Sat', 0.7),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tools to manage time
            const Text(
              'Tools to manage your YouTube time',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildToolTile(Icons.alarm, 'Remind me to take a break', 'Off'),
            _buildToolTile(Icons.bedtime, 'Remind me when it\'s bedtime', 'Off'),
            _buildToolTile(Icons.notifications_off, 'Scheduled digest', 'Off'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildBarChart(String day, double value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 30,
          height: 100 * value,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),
        Text(day, style: const TextStyle(color: Colors.grey, fontSize: 10)),
      ],
    );
  }

  Widget _buildToolTile(IconData icon, String title, String value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: Text(value, style: const TextStyle(color: Colors.grey)),
    );
  }
}

// YouTube Premium Screen
class YoutubePremiumScreen extends StatelessWidget {
  const YoutubePremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Premium Logo
            Container(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.play_arrow, color: Colors.white, size: 32),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Premium',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Get more out of YouTube',
                    style: TextStyle(color: Colors.grey[300], fontSize: 16),
                  ),
                ],
              ),
            ),

            // Features
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildFeature(Icons.block, 'Ad-free videos', 'Watch videos uninterrupted by ads'),
                  _buildFeature(Icons.download, 'Download videos', 'Save videos to watch offline'),
                  _buildFeature(Icons.picture_in_picture, 'Background play', 'Play videos while using other apps'),
                  _buildFeature(Icons.music_note, 'YouTube Music Premium', 'Stream millions of songs ad-free'),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Pricing
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red[900]!, Colors.red[700]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text(
                    'Individual',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Rp 59.000/month',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text('Try it free', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '1-month free trial • Then Rp 59.000/month',
                    style: TextStyle(color: Colors.grey[300], fontSize: 12),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Family plan
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF272727),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Icon(Icons.family_restroom, color: Colors.white, size: 40),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Family plan available',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Share with up to 5 family members',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.red, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text(subtitle, style: TextStyle(color: Colors.grey[400], fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Help & Feedback Screen
class HelpFeedbackScreen extends StatelessWidget {
  const HelpFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Help & feedback', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: [
          // Search
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Describe your issue',
                hintStyle: TextStyle(color: Colors.grey[400]),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF272727),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Popular help resources',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),

          _buildHelpTile('How to create a channel'),
          _buildHelpTile('Troubleshoot video playback issues'),
          _buildHelpTile('Change video quality'),
          _buildHelpTile('Manage watch and search history'),
          _buildHelpTile('Report inappropriate content'),

          const Divider(color: Colors.grey, height: 32),

          ListTile(
            leading: const Icon(Icons.feedback_outlined, color: Colors.white),
            title: const Text('Send feedback', style: TextStyle(color: Colors.white)),
            subtitle: Text('Help us improve YouTube', style: TextStyle(color: Colors.grey[400])),
            onTap: () {
              _showFeedbackDialog(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.forum_outlined, color: Colors.white),
            title: const Text('YouTube Community', style: TextStyle(color: Colors.white)),
            subtitle: Text('Connect with other YouTube users', style: TextStyle(color: Colors.grey[400])),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.support_agent, color: Colors.white),
            title: const Text('Contact us', style: TextStyle(color: Colors.white)),
            subtitle: Text('Get help from YouTube team', style: TextStyle(color: Colors.grey[400])),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildHelpTile(String title) {
    return ListTile(
      leading: const Icon(Icons.article_outlined, color: Colors.grey),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {},
    );
  }

  void _showFeedbackDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF272727),
          title: const Text('Send feedback', style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                maxLines: 4,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Describe your feedback...',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[600]!),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.blue,
                  ),
                  const Expanded(
                    child: Text(
                      'Include system logs',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Thank you for your feedback!')),
                );
              },
              child: const Text('Send'),
            ),
          ],
        );
      },
    );
  }
}