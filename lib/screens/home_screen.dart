import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sign_bridge/data/mock_data.dart';
import 'package:sign_bridge/screens/quiz/video_quiz_screen.dart';
import 'package:sign_bridge/utils/constants.dart';
import 'package:sign_bridge/widgets/lesson_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = MockData.currentUser;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            pinned: true,
            backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.95),
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.back_hand_rounded, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SignBridge', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    Text('Learn & Connect', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal)),
                  ],
                ),
              ],
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orange.withOpacity(0.2)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.local_fire_department_rounded, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text('${user.streakDays}', style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.yellow[50],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.yellow.withOpacity(0.2)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.monetization_on_rounded, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text('${user.xp}', style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),

          // Body
          SliverPadding(
            padding: const EdgeInsets.all(24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Introduction Card
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      )
                    ],
                    image: const DecorationImage(
                      image: CachedNetworkImageProvider(AppConstants.teacherImageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white.withOpacity(0.5)),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.play_arrow_rounded, color: theme.primaryColor, size: 32),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: theme.primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text('Introduction', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'How to use SignBridge',
                              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Start your journey into inclusive communication.',
                              style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // New Arrivals
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('New Arrivals', style: theme.textTheme.headlineMedium),
                    TextButton(onPressed: () {}, child: const Text('See all')),
                  ],
                ),

                SizedBox(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    children: [
                      _buildNewArrivalCard(context, 'Daily Expressions', 'Master common greetings', Icons.volunteer_activism_rounded, Colors.blue),
                      const SizedBox(width: 16),
                      _buildNewArrivalCard(context, 'School Subjects', 'Signs for Math, Science', Icons.school_rounded, Colors.orange),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Basics Path
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Basics Path', style: theme.textTheme.headlineMedium),
                        const Text('Level 1: The Alphabet', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text('1/5 Done', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Stack(
                  children: [
                    // Connecting Line
                    Positioned(
                      left: 31, // Half of 64 icon width approx
                      top: 32,
                      bottom: 32,
                      width: 2,
                      child: Container(color: Colors.grey[200]),
                    ),
                    Positioned(
                      left: 31,
                      top: 32,
                      height: 80, // Approximate progress
                      width: 2,
                      child: Container(color: theme.primaryColor),
                    ),

                    Column(
                      children: MockData.lessons.asMap().entries.map((entry) {
                        final index = entry.key;
                        final lesson = entry.value;
                        return LessonCard(
                          lesson: lesson,
                          isNext: index == 1, // Mock logic: 2nd item is next
                          onTap: () {
                            // Navigate to Video Quiz
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VideoQuizScreen(),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewArrivalCard(BuildContext context, String title, String subtitle, IconData icon, MaterialColor color) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color[50],
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: color[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('New', style: TextStyle(color: color[900], fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const Spacer(),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 12),
          const Row(
            children: [
              Icon(Icons.schedule_rounded, size: 14, color: Colors.grey),
              SizedBox(width: 4),
              Text('15 min', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}
