import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sign_bridge/screens/auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Profile Header
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: theme.primaryColor, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: theme.primaryColor.withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuBeKmFPOyssfBqCmeuAm6iZwRTSqhyrjbWFcBZw-W-AHLZfRGPbOBbpM492c-Aten5W2BPLH8C9Ut4ilujZ2X79ajZg9x60kuVSkOMGKKtQCSbcALrWz7JV-y6qla0ftEKBdlmyYRlK3ge2ZxNocsf_1R1MaLR9hIwmr_q8Kd_asL4ti_Qi7pJutPWpQKNlBZcuP1qFFGpTg_n-NxpKIH75MHveXb256ZVtXBYVKRj1dn_DB2bLW37fBI67TcsBXe0UAoUhjTVfAx9K",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: theme.primaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: theme.scaffoldBackgroundColor, width: 2),
                            ),
                            child: const Icon(Icons.edit, color: Colors.white, size: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Alex Johnson",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "alex.johnson@example.com",
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Stats Dashboard
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E2430) : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatItem(context, "Ranking", "#42", Icons.leaderboard, Colors.orange),
                        Container(width: 1, height: 40, color: Colors.grey.withOpacity(0.2)),
                        _buildStatItem(context, "Points", "2,450", Icons.stars, Colors.yellow[700]!),
                        Container(width: 1, height: 40, color: Colors.grey.withOpacity(0.2)),
                        _buildStatItem(context, "Daily Goal", "45m", Icons.timer, theme.primaryColor),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Weekly Activity",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildBar(context, "Mon", 0.4),
                        _buildBar(context, "Tue", 0.6),
                        _buildBar(context, "Wed", 0.3),
                        _buildBar(context, "Thu", 0.8),
                        _buildBar(context, "Fri", 0.5),
                        _buildBar(context, "Sat", 0.2),
                        _buildBar(context, "Sun", 0.1),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Menu
              _buildMenuItem(context, icon: Icons.settings_outlined, title: "Settings"),
              _buildMenuItem(context, icon: Icons.help_outline, title: "Help & Support"),
              _buildMenuItem(context, icon: Icons.logout, title: "Logout", isDestructive: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String label, String value, IconData icon, Color color) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isDark ? Colors.grey[400] : Colors.grey[500],
          ),
        ),
      ],
    );
  }

  Widget _buildBar(BuildContext context, String label, double heightPct) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        Container(
          width: 8,
          height: 80 * heightPct,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: isDark ? Colors.grey[500] : Colors.grey[400],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, {required IconData icon, required String title, bool isDestructive = false}) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E2430) : Colors.white,
          borderRadius: BorderRadius.circular(16),
           boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isDestructive ? Colors.red.withOpacity(0.1) : theme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: isDestructive ? Colors.red : theme.primaryColor,
              size: 20,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isDestructive ? Colors.red : (isDark ? Colors.white : Colors.black87),
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
          onTap: () {
            if (isDestructive) {
              // Handle Logout logic or navigation back to Login
              Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            }
          },
        ),
      ),
    );
  }
}
