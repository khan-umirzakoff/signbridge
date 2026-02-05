import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sign_bridge/main_navigation_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignIn = true;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Hero Section
              Container(
                width: 128,
                height: 128,
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCmsmJQK6AKTZn5jxJzScoSgfhcMbOOQaJfTkbL-sJqpIraNOhu8p9pfKQlcWmpYX_II6sImRDd-XkIGpod2EftjhFa1iYJ3p1kWVKaOo51lDl7XPHCDlMkHWQ-q3O4hqO-HB42GmFDfeoRh8r_-Nr7Dzoot_WL94F3CxmiWyH7m39HFA8hEZMjZLJhw8EwyKOyJBt1845AGBVRRcL9lDODU3YmZVph4XVnVAfvsuXJwdm4LlNaLFVfcGz26gnDMRy3GQEp4zffwSp5",
                        fit: BoxFit.cover,
                        width: 128,
                        height: 128,
                        color: Colors.white.withOpacity(0.2),
                        colorBlendMode: BlendMode.dstATop,
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                    const Center(
                      child: Icon(Icons.back_hand, size: 48, color: Colors.white), // Material 'sign_language' might not be available in default set, checking alternatives. 'back_hand' or 'handshake'
                      // The design uses 'sign_language' symbol.
                      // I'll use Icons.sign_language if available (Material Symbols), or similar.
                    ),
                    Center(
                       child: Icon(Icons.front_hand, size: 48, color: isDark ? Colors.white : theme.primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                isSignIn ? "Welcome back!" : "Create Account",
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isSignIn
                    ? "Sign in to continue your learning journey."
                    : "Join us and start learning sign language today.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                ),
              ),
              const SizedBox(height: 32),

              // Toggle
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1C1F27) : Colors.grey[200],
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => isSignIn = true),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSignIn
                                ? (isDark ? const Color(0xFF282E39) : Colors.white)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: isSignIn
                                ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)]
                                : [],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: isSignIn
                                  ? (isDark ? Colors.white : Colors.black)
                                  : (isDark ? Colors.grey[400] : Colors.grey[500]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => isSignIn = false),
                        child: Container(
                          decoration: BoxDecoration(
                            color: !isSignIn
                                ? (isDark ? const Color(0xFF282E39) : Colors.white)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: !isSignIn
                                ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)]
                                : [],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: !isSignIn
                                  ? (isDark ? Colors.white : Colors.black)
                                  : (isDark ? Colors.grey[400] : Colors.grey[500]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Form
              Column(
                children: [
                  _buildTextField(
                    context,
                    label: "Email Address",
                    hint: "hello@example.com",
                    icon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    context,
                    label: "Password",
                    hint: "••••••••",
                    icon: Icons.lock_outline,
                    isPassword: true,
                    isPasswordVisible: isPasswordVisible,
                    onVisibilityChanged: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  if (isSignIn)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text("Forgot Password?"),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 24),

              // Action Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const MainNavigationScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 4,
                    shadowColor: theme.primaryColor.withOpacity(0.4),
                  ),
                  child: Text(
                    isSignIn ? "Sign In" : "Sign Up",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Social Login
              Row(
                children: [
                  Expanded(child: Divider(color: isDark ? Colors.grey[800] : Colors.grey[300])),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Or continue with",
                      style: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[500], fontSize: 14),
                    ),
                  ),
                  Expanded(child: Divider(color: isDark ? Colors.grey[800] : Colors.grey[300])),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(context,
                    child: Container(
                      width: 24, height: 24,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.yellow, Colors.red, Colors.blue],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  _buildSocialButton(context, icon: Icons.apple), // Using Icon for Apple
                  const SizedBox(width: 24),
                  _buildSocialButton(context, icon: Icons.facebook, color: const Color(0xFF1877F2)),
                ],
              ),
              const SizedBox(height: 32),

              // Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isSignIn ? "Don't have an account?" : "Already have an account?",
                    style: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[500]),
                  ),
                  TextButton(
                    onPressed: () => setState(() => isSignIn = !isSignIn),
                    child: Text(isSignIn ? "Sign Up" : "Sign In"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? onVisibilityChanged,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
          ),
        ),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1C1F27) : Colors.grey[100],
            borderRadius: BorderRadius.circular(28),
          ),
          child: TextField(
            obscureText: isPassword && !isPasswordVisible,
            style: TextStyle(color: isDark ? Colors.white : Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              prefixIcon: Icon(icon, color: Colors.grey[400]),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey[400],
                      ),
                      onPressed: onVisibilityChanged,
                    )
                  : null,
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(BuildContext context, {Widget? child, IconData? icon, Color? color}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1C1F27) : Colors.grey[100],
        shape: BoxShape.circle,
        border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[200]!),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () {},
          child: Center(
            child: child ?? Icon(icon, color: color ?? (isDark ? Colors.white : Colors.black)),
          ),
        ),
      ),
    );
  }
}
