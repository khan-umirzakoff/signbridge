import 'package:flutter/material.dart';
import 'package:sign_bridge/models/lesson.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  final bool isNext; // Is this the next lesson to take?
  final VoidCallback? onTap;

  const LessonCard({
    super.key,
    required this.lesson,
    this.isNext = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLocked = lesson.isLocked;
    final isCompleted = lesson.progress >= 1.0;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        children: [
          // Icon Container
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: isLocked
                      ? Colors.grey[200]
                      : (isNext ? Colors.white : theme.primaryColor),
                  borderRadius: BorderRadius.circular(16),
                  border: isNext
                      ? Border.all(color: theme.primaryColor, width: 4)
                      : Border.all(color: Colors.white, width: 4),
                  boxShadow: [
                    if (!isLocked)
                      BoxShadow(
                        color: theme.primaryColor.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                  ],
                ),
                child: Center(
                  child: isLocked
                      ? const Icon(Icons.lock, color: Colors.grey)
                      : (isCompleted
                          ? const Icon(Icons.check_rounded,
                              color: Colors.white, size: 32)
                          : (isNext
                              ? Text(
                                  "02", // Mock number, should be dynamic
                                  style: TextStyle(
                                    color: theme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                )
                              : const Icon(Icons.play_arrow_rounded,
                                  color: Colors.white, size: 32))),
                ),
              ),
              if (isCompleted)
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(Icons.star, color: Colors.white, size: 10),
                  ),
                ),
              if (isNext)
                 Positioned(
                  bottom: -8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text("Start", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                )
            ],
          ),
          const SizedBox(width: 16),
          // Content Card
          Expanded(
            child: GestureDetector(
              onTap: isLocked ? null : onTap,
              child: Opacity(
                opacity: isLocked ? 0.6 : 1.0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      if (isNext)
                         Container(
                           width: 4,
                           height: 40,
                           decoration: BoxDecoration(
                             color: theme.primaryColor,
                             borderRadius: BorderRadius.circular(2),
                           ),
                           margin: const EdgeInsets.only(right: 12),
                         ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lesson.title,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isLocked ? Colors.grey : Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              lesson.subtitle,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!isLocked)
                        Icon(
                          isNext ? Icons.play_arrow_rounded : Icons.chevron_right_rounded,
                          color: isNext ? theme.primaryColor : Colors.grey[300],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
