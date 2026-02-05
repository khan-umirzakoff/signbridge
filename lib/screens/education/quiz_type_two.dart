import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class QuizTypeTwo extends StatefulWidget {
  const QuizTypeTwo({super.key});

  @override
  State<QuizTypeTwo> createState() => _QuizTypeTwoState();
}

class _QuizTypeTwoState extends State<QuizTypeTwo> {
  int? selectedOption; // 0 or 1

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    "BASIC GREETINGS",
                    style: TextStyle(
                      color: isDark ? Colors.grey[400] : Colors.grey[500],
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                       Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    child: Text("Exit", style: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[600], fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 24),
               child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: 0.5,
                    backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
                    minHeight: 8,
                  ),
                ),
             ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  const Text(
                    "Match the video",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Select the video that corresponds to the word below.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[600]),
                  ),
                  const SizedBox(height: 32),

                  // Option A
                  _buildVideoOption(
                    context,
                    index: 0,
                    imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuAtALw7nfqadu-XUR3LjkvE8i4xaOaCnFbmiwOANOlq5GjXvsSnVSLbGtiFL4EKZSAVCO5jP9Fe0uQy1VVgAeLjDqIqYs1JASNi4uIASxz6Bv6RUXNbEZnioblrppgWxO64zNbIvcMIP_Z8XU3ZsY-QQcongD89kDDmkwrfG5iwnW8X_zdEP_3yuJI2cOPauF9AGof2UlD5lRdoHe35wd8Soh5N_sa169Sl1gbwtfaioNIi_jv1kUKkOpGD2BTaArvVpd94yEF_4bS1",
                    label: "Option A",
                  ),
                  const SizedBox(height: 16),
                   // Option B
                  _buildVideoOption(
                    context,
                    index: 1,
                    imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuBXt8zzBuhQ7ZlqJJ-27yKOh3mQAJmAmafpWHuqhD6YM54_Bu9srLGMUh6jLvLViSHn1GhxUFqtvvFzRSfn7BnUv6ekNRKSJqHuAm-IDbojXppvVtS1HphjCmQ6HE99MR63Ha0abl5pYU7eiB0hDENAW1Jylns2UaCXENx2fZbU5EkNr7ZheFdJnzvXtOi8_HxODFbdG7eYTWd30svdI6xc4bJQVA3rEe_HZXrktCrqqza3hcgdD44sLJb3YXfHlxz27BPhfUnVN2NN",
                    label: "Option B",
                  ),
                ],
              ),
            ),

            // Footer
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDark ? theme.scaffoldBackgroundColor : Colors.white,
                border: Border(top: BorderSide(color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey[200]!)),
              ),
              child: Column(
                children: [
                  Text(
                    "FIND THE SIGN FOR",
                    style: TextStyle(
                      color: isDark ? Colors.grey[400] : Colors.grey[500],
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Family",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF111318),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: selectedOption != null ? () {
                         // Finish Quiz
                         Navigator.popUntil(context, (route) => route.isFirst);
                      } : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        foregroundColor: Colors.white,
                         disabledBackgroundColor: isDark ? Colors.grey[800] : Colors.grey[300],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                        elevation: 4,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Check Answer", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(width: 8),
                          Icon(Icons.check),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoOption(BuildContext context, {required int index, required String imageUrl, required String label}) {
     final theme = Theme.of(context);
     final isSelected = selectedOption == index;

     return GestureDetector(
       onTap: () => setState(() => selectedOption = index),
       child: AnimatedContainer(
         duration: const Duration(milliseconds: 200),
         height: 200,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(16),
           border: Border.all(
             color: isSelected ? theme.primaryColor : Colors.transparent,
             width: 4,
           ),
           boxShadow: isSelected
               ? [BoxShadow(color: theme.primaryColor.withOpacity(0.3), blurRadius: 12)]
               : [],
         ),
         child: ClipRRect(
           borderRadius: BorderRadius.circular(12),
           child: Stack(
             fit: StackFit.expand,
             children: [
               CachedNetworkImage(
                 imageUrl: imageUrl,
                 fit: BoxFit.cover,
               ),
               Container(color: Colors.black.withOpacity(0.2)),
               Center(
                 child: Container(
                    width: 56, height: 56,
                    decoration: BoxDecoration(
                      color: isSelected ? theme.primaryColor : Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white.withOpacity(0.4)),
                    ),
                    child: const Icon(Icons.play_arrow, color: Colors.white, size: 32),
                 ),
               ),
               if (isSelected)
                 Positioned(
                   top: 12,
                   left: 12,
                   child: Container(
                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                     decoration: BoxDecoration(
                       color: theme.primaryColor,
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Row(
                       children: [
                         const Icon(Icons.check_circle, color: Colors.white, size: 16),
                         const SizedBox(width: 4),
                         Text(
                           label,
                           style: const TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 12,
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
                if (!isSelected)
                  Positioned(
                   top: 12,
                   left: 12,
                   child: Container(
                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                     decoration: BoxDecoration(
                       color: Colors.black.withOpacity(0.6),
                       borderRadius: BorderRadius.circular(20),
                       border: Border.all(color: Colors.white.withOpacity(0.2)),
                     ),
                     child: Text(
                       label,
                       style: const TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontSize: 12,
                       ),
                     ),
                   ),
                 ),
             ],
           ),
         ),
       ),
     );
  }
}
