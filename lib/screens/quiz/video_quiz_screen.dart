import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sign_bridge/data/mock_data.dart';
import 'package:sign_bridge/screens/quiz/association_quiz_screen.dart';

class VideoQuizScreen extends StatefulWidget {
  const VideoQuizScreen({super.key});

  @override
  State<VideoQuizScreen> createState() => _VideoQuizScreenState();
}

class _VideoQuizScreenState extends State<VideoQuizScreen> {
  String? selectedOptionId;
  bool isChecked = false;

  void _checkAnswer() {
    setState(() {
      isChecked = true;
    });

    // For demo, wait and navigate to next quiz
    if (selectedOptionId == MockData.quizA.correctAnswerId) {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const AssociationQuizScreen()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final quiz = MockData.quizA;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.local_fire_department_rounded, color: Colors.orange, size: 16),
                        SizedBox(width: 4),
                        Text('12', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Progress Bar
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
                  minHeight: 12,
                ),
              ),
              const SizedBox(height: 8),
              const Text('Question 1 of 2', style: TextStyle(color: Colors.grey, fontSize: 12)),

              const SizedBox(height: 24),

              // Video / Image Area
              AspectRatio(
                aspectRatio: 4/3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.black,
                    image: const DecorationImage(
                      image: CachedNetworkImageProvider('https://lh3.googleusercontent.com/aida-public/AB6AXuD81EJOT7JO4CGofH9eXDftAQ3wNNO_Zc3ZSDX88zLQFi0ANt-Gv7WKL46-_e3aRT0w2pLsQkZ0o6AE8ssqLdAS-kRMKDhbgVP6UmdiBZLkyUYrWfh1Zv4NYKnjMqEXIk8jpDPAqXpVYnZjpicAhByB1PaqpxzuNtVPeZ9KmzxwYmDy54kyY6TDSl4hQDscsog3VW9triSdIJVp9uSp8aCX44jSHqtuJFYNhMTdkN5FcyLlwjvFqAFiu5wXfb7zeDQrCmnf4cx2DOog'), // Hardcoded from design
                      fit: BoxFit.cover,
                      opacity: 0.8,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                      ),
                      child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 32),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
              Text(quiz.question, style: theme.textTheme.headlineMedium, textAlign: TextAlign.center),
              const Text('Select the correct translation', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 24),

              // Options Grid
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: quiz.options.length,
                  itemBuilder: (context, index) {
                    final option = quiz.options[index];
                    final isSelected = selectedOptionId == option.id;
                    final isCorrect = option.id == quiz.correctAnswerId;

                    Color borderColor = Colors.transparent;
                    Color bgColor = Colors.white;

                    if (isChecked) {
                      if (isCorrect) {
                        borderColor = Colors.green;
                        bgColor = Colors.green.withOpacity(0.1);
                      } else if (isSelected) {
                        borderColor = Colors.red;
                        bgColor = Colors.red.withOpacity(0.1);
                      }
                    } else if (isSelected) {
                      borderColor = theme.primaryColor;
                      bgColor = theme.primaryColor.withOpacity(0.05);
                    }

                    return GestureDetector(
                      onTap: isChecked ? null : () => setState(() => selectedOptionId = option.id),
                      child: Container(
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: borderColor, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.waving_hand_rounded, color: Colors.blue), // Placeholder icon
                            ),
                            const SizedBox(height: 12),
                            Text(option.text, style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Check Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (selectedOptionId != null && !isChecked) ? _checkAnswer : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isChecked
                        ? (selectedOptionId == quiz.correctAnswerId ? Colors.green : Colors.red)
                        : theme.primaryColor,
                  ),
                  child: Text(isChecked ? 'Continue' : 'Check Answer'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
