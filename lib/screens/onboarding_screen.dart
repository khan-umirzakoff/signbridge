import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sign_bridge/utils/constants.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        // Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                              child: const Text('Skip'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // Image Section
                        Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                             Container(
                               width: 280,
                               height: 280,
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.white,
                                 boxShadow: [
                                   BoxShadow(
                                     color: Theme.of(context).primaryColor.withOpacity(0.1),
                                     blurRadius: 40,
                                     spreadRadius: 10,
                                   )
                                 ]
                               ),
                             ),
                            CircleAvatar(
                              radius: 120,
                              backgroundColor: Colors.grey[200],
                              backgroundImage: const CachedNetworkImageProvider(
                                AppConstants.onboardingImage,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                    )
                                  ]
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('🤟', style: TextStyle(fontSize: 24)),
                                    SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('SAY HELLO', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                                        Text('Nice to meet you!', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Text Content
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 28),
                            children: [
                              const TextSpan(text: 'Language for \n'),
                              TextSpan(
                                text: 'Everyone',
                                style: TextStyle(color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Master Sign Language and English together. Break barriers and connect with the world through our gamified lessons.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                        ),

                        const SizedBox(height: 30),

                        // Cards
                        Row(
                          children: [
                            Expanded(child: _buildFeatureCard(context, Icons.school_rounded, 'Learn', 'Visual lessons', true)),
                            const SizedBox(width: 8),
                            Expanded(child: _buildFeatureCard(context, Icons.sports_esports_rounded, 'Practice', 'Games', false)),
                            const SizedBox(width: 8),
                            Expanded(child: _buildFeatureCard(context, Icons.emoji_events_rounded, 'Master', 'Rewards', false)),
                          ],
                        ),

                        const Spacer(),
                        const SizedBox(height: 20),

                        // Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Next Step'),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward_rounded, size: 20),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.accessibility_new_rounded, size: 14, color: Colors.grey),
                            SizedBox(width: 4),
                            Text('ACCESSIBILITY OPTIMIZED', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, IconData icon, String title, String subtitle, bool isActive) {
    final color = isActive ? Theme.of(context).primaryColor : Colors.grey[400];
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: isActive ? Border.all(color: Theme.of(context).primaryColor, width: 2) : Border.all(color: Colors.transparent),
        boxShadow: isActive ? [
           BoxShadow(
             color: Theme.of(context).primaryColor.withOpacity(0.1),
             blurRadius: 10,
             offset: const Offset(0, 4),
           )
        ] : [],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isActive ? Theme.of(context).primaryColor.withOpacity(0.1) : Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          Text(subtitle, style: const TextStyle(fontSize: 10, color: Colors.grey), textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
