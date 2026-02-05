import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final categories = [
      {
        "title": "Greetings",
        "count": "12 signs",
        "icon": Icons.waving_hand,
        "color": Colors.blue,
        "image": "https://lh3.googleusercontent.com/aida-public/AB6AXuBP-3kOISZJoJhjDx--GNSWP0JuLuGgnK12LtHbWhWfcm-he2DBNNxAdn3wtZbzUsrWT2yW-nQoTbgvHY0mATF1mgbjp8cq870zUDjTdTzPmVOybrKXC4cWy3d7u9aN_074uIPsiFrJ5casVTUyy3Drv0UVgtYTfJiGNmcIIaDORVDlWJNrE-NoEF8hHgmceHUC2HaE8zXVnvVfGNVuDQ3g8GdY8tu8d47bhkJBAQqtlET-ZJDgmClXadebbSx5CwobyBopibJSwgal"
      },
      {
        "title": "Family",
        "count": "24 signs",
        "icon": Icons.diversity_3,
        "color": Colors.purple,
        "image": "https://lh3.googleusercontent.com/aida-public/AB6AXuAxS5GhUBZDugQZ5U0c3itE6OQO7Tz7xIrQRSo4HC1fI12MUpu3tdOOq3MGYu76Nqs0glIM3LRUmSoKNyJr1oi5k06li-ty-I21XEP-eFFGUSf4RXPa4z9gTVmJm_tUafRQxa2wTvryzyA0jY8kRgYhZRYRLtPfVOOzkE4HzrxRKBjn-t68x93oIPe60HJtaKN9Kv8bAoAzBLcuccVqfmhqdDMNZgM34BFYJ5HFs-Pt8gucR33U-bYX7ltxZ2LCQSfvJFhq0gc8sJ3G"
      },
      {
        "title": "Food & Drink",
        "count": "45 signs",
        "icon": Icons.restaurant,
        "color": Colors.green,
        "image": "https://lh3.googleusercontent.com/aida-public/AB6AXuCIFfvB9qkn1ew-t4EJqEa07QIY5vtHsMCtJRZEgT4HoT2YsG54B9xELTC3k7H1SpEt4MNc9SUEzM3dwaxS3nlZtHEpS46h2kk_LgovtF1roexNksZcBzCnPNUrGkTUvp_S6x41fI7ZWIKraCE1-1WqyZZWNsTZI3YWcUukLsfXZBcHl0Num-yWSN0_ElNDSXRk-3ABFOamxGyAciMswy_nRxQaGk27u8C7X6oj30JOR9DJM62KJPSPWNb9sFb2xGAamGs1MHvP2ZAT"
      },
      {
        "title": "Emotions",
        "count": "18 signs",
        "icon": Icons.sentiment_satisfied,
        "color": Colors.orange,
        "image": "https://lh3.googleusercontent.com/aida-public/AB6AXuCh6GS3SI_HicrjkuZKoDACrt9uR2R2CJh1jDGW_VhB8HaxQ4_Ksn54zzJLOEIKzka-lMVoQGKfkODqz6HtgnXHTFTsdGxjW0a_7i15_anHEvSrFMQMyLuuiKPLCtYAzwM6Lk856cbZ1Ob-5igdneHGGuIlDuMCno3hR1bJR_RNMd92a-IAa3OTp5Q-N41xXU6olvHt_WCa2oybyqCQH2988ev_OTm7dik2McBO1Y6xXDcc383KD7vP6sPCDbvo1hmMU6LzIEhQMqof"
      },
      {
        "title": "Numbers",
        "count": "10 signs",
        "icon": Icons.filter_1,
        "color": Colors.red,
        "image": "https://lh3.googleusercontent.com/aida-public/AB6AXuAtVQH8666QAmCS4zJpQRrBlmywwHfFISlM5QFsCiqcmfMGLK7RB42GW0Rx95Gt-TRO2_wc18xRubWNGeWUG5cVeMNL9SWw6EWdFwW2_tCIJA2UGR6FRqpxMYs8I2j9pa8Egtkemkzah2bX_jFPWRPkQEkYZnp1xgDmzCkyrY0fEvmKeudv15uh_wSACRXG_pfUkWxo04DvRF-bDRfOsbWKbAp74lPmn6Q-5X7YCU3AlOOsgJxX3-uuIGmg2KZm7aP7w913i51ituF3"
      },
      {
        "title": "Alphabet",
        "count": "26 signs",
        "icon": Icons.abc,
        "color": Colors.indigo,
        "image": "https://lh3.googleusercontent.com/aida-public/AB6AXuAb22323CY8W2fQEgM3LceVXJjHm87GST25x9T3QfhtYtDLtfImkE6m48_3i6oyq9-swBK6pCW7xJFE9lQkU4SSk8INW8gljgAUnBCx3DY2w9RhxQ9P5MDodWg4qmvOvhiPYzKoO9coQf-zFPhFefbBQNUa7cn8TskgjE7FB_m5l1bByH7RVhbWs02DnxV2Q136sJMO5nTKEyd2hfAQv9C_6Ry6wszJHx94nZ7xC7W0-pyeSVFuoIufIGxx82tGmXIWCsrAY5coO_90"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            // In main nav context, this might not do anything if it's the root of the tab.
            // But if we navigated here, it would pop.
          },
        ),
        title: const Text('Dictionary'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search 2000+ signs...',
                filled: true,
                fillColor: isDark ? const Color(0xFF1E2430) : Colors.white,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              ),
            ),
          ),

          // Content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const Text(
                  "Explore Categories",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    return _buildCategoryCard(context, cat);
                  },
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, Map<String, dynamic> category) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
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
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: category['image'],
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black54],
                      stops: [0.5, 1.0],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                      // backdrop filter could be added but explicit blur is heavy
                    ),
                    child: Icon(category['icon'], color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    category['count'],
                    style: TextStyle(
                      color: isDark ? Colors.grey[400] : Colors.grey[500],
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
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
}
