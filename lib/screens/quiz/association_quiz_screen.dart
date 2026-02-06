import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sign_bridge/data/mock_data.dart';

class AssociationQuizScreen extends StatefulWidget {
  const AssociationQuizScreen({super.key});

  @override
  State<AssociationQuizScreen> createState() => _AssociationQuizScreenState();
}

class _AssociationQuizScreenState extends State<AssociationQuizScreen> {
  String? selectedOptionId;
  bool isChecked = false;

  void _handleOptionTap(String optionId) {
    if (isChecked) return;
    setState(() {
      selectedOptionId = optionId;
      isChecked = true;
    });

    if (optionId == MockData.quizB.correctAnswerId) {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          Navigator.pop(context); // Back to Home
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final quiz = MockData.quizB;

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
                  value: 1.0,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
                  minHeight: 12,
                ),
              ),
              const SizedBox(height: 8),
              const Text('Question 2 of 2', style: TextStyle(color: Colors.grey, fontSize: 12)),

              const SizedBox(height: 32),

              Text(quiz.question, style: theme.textTheme.headlineMedium, textAlign: TextAlign.center),
              const Text('Tap the correct video to answer.', style: TextStyle(color: Colors.grey)),

              const SizedBox(height: 24),

              Expanded(
                child: Row(
                  children: quiz.options.map((option) {
                    final isSelected = selectedOptionId == option.id;
                    final isCorrect = option.id == quiz.correctAnswerId;

                    Color borderColor = Colors.transparent;

                    if (isChecked) {
                      if (isCorrect) {
                        borderColor = Colors.green;
                      } else if (isSelected) {
                        borderColor = Colors.red;
                      }
                    }

                    return Expanded(
                      child: GestureDetector(
                        onTap: () => _handleOptionTap(option.id),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: isChecked && (isCorrect || isSelected) ? borderColor : Colors.transparent,
                              width: 4
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              )
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              alignment: Alignment.center,
                              fit: StackFit.expand,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: indexIsEven(option.id)
                                      ? 'https://lh3.googleusercontent.com/aida-public/AB6AXuAiuayB_p3nRxSOw79a4Ibex_J9NyKjI9ZrQlBLEgpDwuVcPyGHwNUWF-Da3eQKPdogUiUGLUqQmIgh4Qnov1IQfN0Xj2l5By4JxqBYe5PxZClWlIt58NXcCIdn9QXr_UNrecjFbCDceGF_i2Sa5-6LQtTJpnMPc5H0x5dHZg5SWvqTokHptL8C0hQHvXGj2B6m_aQ2tIjNQNiWl-EgqZnPHNhV5LMevUl1rKfeChxGITt2vlUkAA1hi7vfDS37vRVmpnVcfY6jmLvw'
                                      : 'https://lh3.googleusercontent.com/aida-public/AB6AXuDcw182YQiEb4MtvcfG6F4YKPv45Mxp1nuSU3JlvkJqTmIYzawMldnmceVHIovV7AwSHTCxzLHvyzP0pFPKXTj8yv-zmAVR6Tik-i3xQA5AML5V5lrMez9WcGNHrOvdH6KY3z01OFGZshWusc1sfaPxAuFc_1sP5BfbmLFe0rqaedO2HK_FJTsP2kGV8BbDCv9I5vp1mb9rTpuOye1SyImbSQ4lLjrJId2eDaP7fjBPh1U7uTq8yPROZ36b4HrHNqlguwLw7umiYb6o',
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                  child: const Icon(Icons.play_circle_fill_rounded, color: Colors.white, size: 48),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 32),

              const Text('Match this word', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey, letterSpacing: 1.2)),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ],
                  border: Border.all(color: Colors.grey[100]!),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Family', style: TextStyle(color: theme.primaryColor, fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 12),
                    const Icon(Icons.drag_indicator_rounded, color: Colors.grey),
                  ],
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  bool indexIsEven(String id) {
    return id.hashCode % 2 == 0;
  }
}
