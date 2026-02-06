import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sign_bridge/data/mock_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = MockData.currentUser;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: CachedNetworkImageProvider(user.avatarUrl),
                      ),
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello, ${user.name}', style: theme.textTheme.headlineMedium),
                      Text(user.email, style: TextStyle(color: Colors.grey[500], fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)
                      ],
                    ),
                    child: const Icon(Icons.notifications_none_rounded),
                  )
                ],
              ),

              const SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Your Stats', style: theme.textTheme.headlineMedium),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.local_fire_department_rounded, color: theme.primaryColor, size: 16),
                        const SizedBox(width: 4),
                        Text('${user.streakDays} Day Streak', style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Stats Grid
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(context, 'Lessons', '48', '12%', Icons.school_rounded, Colors.orange),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(context, 'Hours', '12.5', null, Icons.schedule_rounded, Colors.blue),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Activity Chart (Mock)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(color: Colors.black87, shape: BoxShape.circle),
                              child: const Icon(Icons.bar_chart_rounded, color: Colors.white, size: 16),
                            ),
                            const SizedBox(width: 8),
                            const Text('Activity', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)],
                                ),
                                child: const Text('Weekly', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text('Month', style: TextStyle(color: Colors.grey[500], fontSize: 10, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _buildBar(context, 'Mon', 0.4),
                          _buildBar(context, 'Tue', 0.25),
                          _buildBar(context, 'Wed', 0.75, isActive: true),
                          _buildBar(context, 'Thr', 0.5),
                          _buildBar(context, 'Fri', 0.35),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Leaderboard
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Leaderboard', style: theme.textTheme.headlineMedium),
                  const Text('See All', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
              const SizedBox(height: 16),

              _buildLeaderboardItem(context, 1, 'Sarah M.', 'Pro Member', '2,450 XP', 'https://lh3.googleusercontent.com/aida-public/AB6AXuAkwFjB6z9CWi92GAhrv2iUkRCbpYQ0FWMV9CYyJaGMbOlyLZO9ODoADMLLgTLCqtMh2GEK3r3dnIBPM28U1J2OBxhZ5PpGSbIdNwO-Pr4R9WrHahiCS50G09-L5rN6EZfLzjFjPQPMB9mfozRIja9bnuKOwe83H3-vOG6shMakdbhcShLJ5LB3FDIuyhDyJd4ETbTUtZBDy3_8OfelptgArRXW_FfaRVyQtddQnm2mOREckk8dZOkyHXEd03ea1ts6QeCYIw50NIiU'),
              const SizedBox(height: 12),
              _buildLeaderboardItem(context, 2, 'Mike R.', 'Student', '2,100 XP', 'https://lh3.googleusercontent.com/aida-public/AB6AXuAan1E9Fmq0wG5LdwTetYsZtWUn2vEMMLZbSbbW5-qC-Zy3qiOMSJapEzy-C3ccmOUMBbbCbUlexINJWGF_zQ2sXsAvbo86Cj3fsjTnsfTB-n79mol0a4LKVJFqu4GG6gwptmQCo4KFpjx7tCWKRYb_c9gKzNfcTjTv2DjNIxBw9mNNPJEc8s34a49me6wdWOKuLQ8QzI4xlEZ3YXmYM9hFQUdEMU9jrdvErMjK0p4eE3gNRZ4jo8T1vUzEShu4dX-0V7n2yZS6t0dh'),
              const SizedBox(height: 12),
              _buildLeaderboardItem(context, 3, 'You', 'Jacob', '1,890 XP', user.avatarUrl, isMe: true),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, String? change, IconData icon, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: color[50], shape: BoxShape.circle),
                child: Icon(icon, color: color, size: 16),
              ),
              const SizedBox(width: 8),
              Text(title, style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              if (change != null) ...[
                const SizedBox(width: 4),
                Text('▲ $change', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 10)),
              ],
              if (change == null) ...[
                const SizedBox(width: 4),
                Text('hrs', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold, fontSize: 10)),
              ]
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBar(BuildContext context, String day, double heightPct, {bool isActive = false}) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 40,
              height: 120,
              decoration: BoxDecoration(
                color: isActive ? Colors.orange[50] : Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Container(
              width: 40,
              height: 120 * heightPct,
              decoration: BoxDecoration(
                color: isActive ? Theme.of(context).primaryColor : Theme.of(context).primaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(day, style: TextStyle(color: isActive ? Colors.black : Colors.grey[400], fontWeight: FontWeight.bold, fontSize: 12)),
      ],
    );
  }

  Widget _buildLeaderboardItem(BuildContext context, int rank, String name, String subtitle, String xp, String avatarUrl, {bool isMe = false}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isMe ? const Color(0xFF2C2C30) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: isMe ? [BoxShadow(color: Theme.of(context).primaryColor.withOpacity(0.3), blurRadius: 10)] : [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Row(
        children: [
          SizedBox(width: 30, child: Center(child: Text('$rank', style: TextStyle(fontWeight: FontWeight.bold, color: isMe ? Colors.white54 : Colors.grey[400])))),
          CircleAvatar(backgroundImage: CachedNetworkImageProvider(avatarUrl)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold, color: isMe ? Colors.white : Colors.black)),
              Text(subtitle, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isMe ? Colors.white54 : Colors.grey[400], letterSpacing: 0.5)),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isMe ? Colors.white.withOpacity(0.1) : Colors.yellow[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(xp, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: isMe ? Colors.white : Colors.orange[800])),
          )
        ],
      ),
    );
  }
}
