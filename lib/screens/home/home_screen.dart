import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      // App Bar
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.back_hand, color: theme.primaryColor, size: 32),
            const SizedBox(width: 8),
            Text(
              'SignBridge',
              style: TextStyle(
                color: isDark ? Colors.white : const Color(0xFF111318),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isDark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.05)),
            ),
            child: Row(
              children: [
                const Text('🪙', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 4),
                Text(
                  '240',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDark ? const Color(0xFFFFD700) : theme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
                color: isDark ? Colors.white : Colors.grey[600],
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: theme.scaffoldBackgroundColor, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section (Tutorial Video)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E2430) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: CachedNetworkImage(
                              imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDBsrG1E7F-ludvW7uMcww4KstvYHkb0gjN_60SMHwTZzDi9ABaNAdbuIhm1YC50oZeLChL7NL1mNTw8BJuCF5soBXeCMtzLdE4HQ7QoJS_s3c6mTnjaH4IcHW2DDJIWdMtkdUrJeI8wQsunKVZff1ALeI-cShPJs8z58LIgt1tGz_Hpt3WnT6CMMbY-gpn0kUvaPqYagD056FI1R5rHIoRWekOUidGyozkkomqCN2YKbj65RroFU7VbhXW_o0WhsJWJ9RPSKhvmtyy',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white.withOpacity(0.4)),
                          ),
                          child: const Center(
                            child: Icon(Icons.play_arrow, color: Colors.white, size: 32),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "GETTING STARTED",
                            style: TextStyle(
                              color: theme.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Start Here: How to use this app",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Welcome to the community!",
                                style: TextStyle(
                                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.primaryColor,
                                  foregroundColor: Colors.white,
                                  shape: const StadiumBorder(),
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                ),
                                child: const Text("Play Video"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // New Video Lessons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "New Video Lessons",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See All"),
                  ),
                ],
              ),
            ),

            _buildLessonItem(
              context,
              title: "Alphabet: A-M",
              duration: "4:00",
              progress: 0.33,
              imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDfznFERKUOZmzVSFxBG1tGF6V-kmig2lw1jR8Y1zp7XJf_U4tNS1NbCx_JTawZxK-Xnpj46EJMjY04Ru5fZLDZBoe0uq1fWGlf1kht2QWRFbS7Or8DeDIqNnEVFswwXagsu-x_a2KAefFHZIlUfpg3n82kYPkNbZDOPvD4MQCiQQnSOLGgOJhzYgBH8sW81NwzX6lUOa8pZlLu828ToS-QiTV-sSZGPFa1Sn-1AvYC2aTcwj5pmrca8uR8R2ZNMOO149CBdfFWWDvH",
            ),
            _buildLessonItem(
              context,
              title: "Common Greetings",
              duration: "2:30",
              progress: 0.0,
              imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuB2scAxRXxvIf-55dUJOF5hLdC7XswoBF_p_6u8jGaUh_GIv3fL5qwZx7vRPzRgFNqsMEQotTCRcoS1Cl52NLBlc_OkEoJ15y-oM7xjLsBc3jUfmX-Mi0VFlsymFT_v41FuyjYsX_vrYDMgtqm_ryQZ-nC7sx6haU-qPIXlXmx_5wv9rqsPcLnaDMmSJCzVDVdiYGWhbt7ckLZnxHfPb6vDVUr9CSjGWzVxeeu_bH30yrafOK2fnGt8_AH1Ap-PV2IcbFZT_JggveBR",
            ),

            const SizedBox(height: 24),

            // Sign Language Learning (Carousel)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sign Language Learning",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See All"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCarouselItem(
                    context,
                    title: "Family Members",
                    icon: Icons.diversity_3,
                    imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuAxbLNjmavPKPOtpRSO9FO_CXeriU2H7_b-pQq0DBKgsxjXidujn_auU_QEsT6iyaxPAgSiG8M4B5OElDT6GV8XNnmIT5OODGPnWWYffmq4hIe_wEbcZtZNCX2tRpvvTsY-n08-fqxSbSEjn-mgJbvfSJq_KEinT3lj-YT2C185OZBtLk7OewPGBghdRkuaiPC4mfSVVU3_9fdaFavFIyAVDUzqVs1YHXclz9sdqtHapx0ValxckNQoWSN-xoEuhosHaE4SK5kI1fKX",
                  ),
                  _buildCarouselItem(
                    context,
                    title: "Colors & Numbers",
                    icon: Icons.palette,
                    imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCPVNG3ePaPzPELjKqcxng8q9PF3ZFxBsjZ_WBhYT9Bck30pwcwhtw6sKOAMfUgESggAIw7eIPidThITmRsifT4JhQ8_LCI5zPGsiznzKn5SD3Y_mJp4W9lOJtii5bj6NMUHmn-raEz6Yh7-XTkYBmbhX0b5msQC1rKL4YD2zWoVcZiv38XtRkxLDou8EwYShuj22zYxBNk5b3-SAYWDdx4E9ZXckFrzhTQwIdWJE1AQD3-sxs1TGc9lxAMdCgzYDWnC4F20E7FwUEF",
                  ),
                  _buildCarouselItem(
                    context,
                    title: "Emergency Signs",
                    icon: Icons.medical_services,
                    imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCJ7Fgdovx-LEQLPbytQd_9tTKUax5oUUrX6H170tGIu31BDMEGIMJ11yiMNPsR_6_1g_PomddfJjXju6DW03czZdlroa0S6k0qb5jwjVKGdMMgej9uWKi7rLqTpHA23dAVoW3Zp66-1wc7LLGm5yIG2e2g8CvQz4BnUo6yizWCbGhWWx28dfsfyBYTga9NSweqymVc9QmuAiCM9uaE-uS44teVuj1ZxaZkQeTpy8cH3qidJ0CC_cOi8X-moKpwqGttZ11oa0c-cqyl",
                  ),
                  _buildCarouselItem(
                    context,
                    title: "Food & Drink",
                    icon: Icons.restaurant,
                    imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCr00EcMuxZvm7g41MNI7zY7RN5Oj4P-KzV709o4DA6b2HVOzWdq0bfvJuVecOKVpmGPBDUPT_o650heuptGpJxT89I6Zw2iWi5ktmwEYayzi7yGCvc8xG2UPH9oStPKQcFBmJuGQ91x2Itw4Rh5bzmN3yeWURixe0FZyQg_Qvh6704X2pVjfRLHgXRyqqTqdug2RFFOkmT7izIQg1hVcIAYSbfldhtLzvsBpXM-9tLqLFWa_ag3eYRMLuKTC_oG29MUYPPHS1FzSfD",
                  ),
                  _buildCarouselItem(
                    context,
                    title: "Emotions",
                    icon: Icons.sentiment_satisfied_alt,
                    imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuATNwri9T__8y-9uwFSm683tM-niqPIisxj4DFZisNitNjTiv7f_07-36p2FhygxWR85d52DmTLAXU_LT4PPOIYoZfHbKBBiiz6M8MeHS_7Lc89ovxP6y-CiqYwwypzE6ildlhkBkCpWYomIx89j66IvU_26UU9L8BtjtNMC8SbP4WcUccnz47C9P6YVh3iageKm5khBLkZ0VjIUka9rpkzW6Ww6CgICHmEIlF6bx4UEccGD4dthNjtAQLLxTWlwhxDe3amU34R2Dd6",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonItem(
    BuildContext context, {
    required String title,
    required String duration,
    required double progress,
    required String imageUrl,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E2430) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 96,
                    height: 54,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      duration,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: isDark ? Colors.white.withOpacity(0.1) : Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
                            minHeight: 4,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        progress == 0 ? "Start" : "${(progress * 100).toInt()}%",
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.grey[400] : Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              Icons.play_circle_fill,
              color: progress > 0 ? theme.primaryColor : (isDark ? Colors.grey[600] : Colors.grey[400]),
              size: 32,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required String imageUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black54],
                          stops: [0.6, 1.0],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Icon(icon, color: Colors.white, size: 24),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 140,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
