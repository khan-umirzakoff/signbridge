import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sign_bridge/screens/education/quiz_type_one.dart';

class EducationPathScreen extends StatelessWidget {
  const EducationPathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final levels = [
      {
        "status": "completed",
        "title": "The Alphabet",
        "description": "A through Z basics",
        "progress": 1.0,
      },
      {
        "status": "completed",
        "title": "Greetings",
        "description": "Hello, Goodbye, & More",
        "progress": 1.0,
      },
      {
        "status": "current",
        "title": "Family & Friends",
        "description": "Next Up: Extended Family",
        "progress": 0.0,
        "total": 5,
        "current_step": 0,
      },
      {
        "status": "locked",
        "title": "Emotions",
        "description": "Expressing how you feel",
      },
      {
        "status": "locked",
        "title": "Numbers",
        "description": "Counting 1-100",
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "ASL Journey",
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: theme.primaryColor, width: 2),
                    ),
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuBeKmFPOyssfBqCmeuAm6iZwRTSqhyrjbWFcBZw-W-AHLZfRGPbOBbpM492c-Aten5W2BPLH8C9Ut4ilujZ2X79ajZg9x60kuVSkOMGKKtQCSbcALrWz7JV-y6qla0ftEKBdlmyYRlK3ge2ZxNocsf_1R1MaLR9hIwmr_q8Kd_asL4ti_Qi7pJutPWpQKNlBZcuP1qFFGpTg_n-NxpKIH75MHveXb256ZVtXBYVKRj1dn_DB2bLW37fBI67TcsBXe0UAoUhjTVfAx9K",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Stats Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.1),
                        border: Border.all(color: Colors.orange.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("🔥", style: TextStyle(fontSize: 20)),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "5 Days",
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "STREAK",
                                style: TextStyle(
                                  color: isDark ? Colors.grey[400] : Colors.grey[500],
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.yellow.withOpacity(0.1),
                        border: Border.all(color: Colors.yellow.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("⭐️", style: TextStyle(fontSize: 20)),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "120",
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "STARS",
                                style: TextStyle(
                                  color: isDark ? Colors.grey[400] : Colors.grey[500],
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Path List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: levels.length + 1,
                itemBuilder: (context, index) {
                  if (index == levels.length) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 48, top: 24),
                      child: Text(
                        "More levels coming soon...",
                        style: TextStyle(
                          color: isDark ? Colors.grey[600] : Colors.grey[400],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                  final level = levels[index];
                  return _buildLevelItem(context, level, index, levels.length);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelItem(BuildContext context, Map<String, dynamic> level, int index, int totalCount) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final status = level['status'] as String;
    final isLast = index == totalCount - 1;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline Column
          SizedBox(
            width: 48,
            child: Column(
              children: [
                Container(
                  width: status == "current" ? 48 : 40,
                  height: status == "current" ? 48 : 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: status == "completed"
                        ? theme.primaryColor
                        : (status == "current" ? theme.scaffoldBackgroundColor : (isDark ? const Color(0xFF1E2430) : Colors.white)),
                    border: status == "current"
                        ? Border.all(color: theme.primaryColor, width: 3)
                        : (status == "locked" ? Border.all(color: Colors.grey, width: 2) : null),
                    boxShadow: status == "completed" || status == "current"
                        ? [BoxShadow(color: theme.primaryColor.withOpacity(0.4), blurRadius: 10)]
                        : [],
                  ),
                  child: Center(
                    child: Icon(
                      status == "completed"
                          ? Icons.check
                          : (status == "current" ? Icons.play_arrow : Icons.lock),
                      color: status == "completed"
                          ? Colors.white
                          : (status == "current" ? theme.primaryColor : Colors.grey),
                      size: status == "current" ? 28 : 20,
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      color: status == "completed" ? theme.primaryColor : Colors.grey.withOpacity(0.3),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Content Column
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: _buildCardContent(context, level, status),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardContent(BuildContext context, Map<String, dynamic> level, String status) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (status == "current") {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: theme.primaryColor.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      level['title'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      level['description'],
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Progress", style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
                Text("0/5 Lessons", style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: 0.1, // Small progress
                backgroundColor: Colors.black.withOpacity(0.2),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                minHeight: 6,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizTypeOne()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: theme.primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text("Start Lesson", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      );
    } else {
      return Opacity(
        opacity: status == "locked" ? 0.6 : 1.0,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E2430) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey.withOpacity(0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    level['title'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF111318),
                    ),
                  ),
                  if (status == "completed")
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "100%",
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                level['description'],
                style: TextStyle(
                  color: isDark ? Colors.grey[400] : Colors.grey[500],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
