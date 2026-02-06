enum QuizType { videoToOptions, wordMatch }

class QuizOption {
  final String id;
  final String text;
  final String? videoUrl; // For matching type

  QuizOption({required this.id, required this.text, this.videoUrl});
}

class Quiz {
  final String id;
  final String question;
  final String? videoUrl; // Main video for question
  final QuizType type;
  final List<QuizOption> options;
  final String correctAnswerId;

  Quiz({
    required this.id,
    required this.question,
    this.videoUrl,
    required this.type,
    required this.options,
    required this.correctAnswerId,
  });
}
