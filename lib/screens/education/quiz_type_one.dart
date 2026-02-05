import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sign_bridge/screens/education/quiz_type_two.dart';

class QuizTypeOne extends StatefulWidget {
  const QuizTypeOne({super.key});

  @override
  State<QuizTypeOne> createState() => _QuizTypeOneState();
}

class _QuizTypeOneState extends State<QuizTypeOne> {
  int? selectedIndex;
  final int correctIndex = 1; // Family

  final List<String> options = ["Friend", "Family", "Father", "Fine"];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: 0.4,
                          backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
                          valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
                          minHeight: 8,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.favorite, color: Colors.red),
                      const SizedBox(width: 4),
                      Text(
                        "5",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      "Question 4 of 10",
                      style: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[500],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "What does this sign mean?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Video Placeholder
                    AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                              imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuB2s5Csk2NVfHFXXsgVvGEYqq4Q-O5b0Q08VZGTcnj_ry_Td2gxK-YcPm1vGuE6P-_c3Ps7YNxLs1KaksYhiv_rqSqklU5lwBx1ZFGIX22y70gAh0350OK241XAFTOC2hFmdcfzR8E174gAdNairqgr5wfXW5GjbWRcSlTbuK6KYvoyYlMP4GgS9R6tMA_0uicSTr_5xOygPoreG_U_4feOhp9E6Yo_yvpm-ythj-mkxdQVij4det4zSFWv-W0RS7ruj9UJ2mWTtnA2",
                              fit: BoxFit.cover,
                            ),
                            Container(
                              color: Colors.black.withOpacity(0.1),
                            ),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                                ),
                                child: const Icon(Icons.play_arrow, size: 40, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Options Grid
                    Expanded(
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.5,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          final isSelected = selectedIndex == index;
                          return GestureDetector(
                            onTap: () => setState(() => selectedIndex = index),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                color: isDark ? const Color(0xFF1E2430) : Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: isSelected ? theme.primaryColor : Colors.transparent,
                                  width: 2,
                                ),
                                boxShadow: isSelected
                                    ? [BoxShadow(color: theme.primaryColor.withOpacity(0.2), blurRadius: 8)]
                                    : [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)],
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      options[index],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: isSelected ? theme.primaryColor : (isDark ? Colors.white : Colors.black),
                                      ),
                                    ),
                                  ),
                                  if (isSelected)
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Icon(Icons.check_circle, color: theme.primaryColor, size: 20),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: selectedIndex != null ? () {
                     // Navigate to Next Quiz (Type 2) for demo purposes
                     Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizTypeTwo()));
                  } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: isDark ? Colors.grey[800] : Colors.grey[300],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 4,
                  ),
                  child: const Text("Check Answer", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
