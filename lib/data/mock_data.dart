import '../models/lesson.dart';
import '../models/quiz.dart';
import '../models/dictionary_item.dart';
import '../models/user_profile.dart';
import '../utils/constants.dart';

class MockData {
  static final UserProfile currentUser = UserProfile(
    id: 'u1',
    name: 'Jacob',
    email: 'jacob.design@gmail.com',
    avatarUrl: AppConstants.userAvatarUrl,
    streakDays: 12,
    xp: 1890,
    level: 3,
  );

  static final List<Lesson> lessons = [
    Lesson(
      id: 'l1',
      title: 'Letters A - E',
      subtitle: 'Foundations of finger spelling',
      isLocked: false,
      progress: 0.2,
      rating: 1,
    ),
    Lesson(
      id: 'l2',
      title: 'Letters F - J',
      subtitle: 'Moving forward',
      isLocked: false,
      progress: 0.0,
      rating: 0,
    ),
    Lesson(
      id: 'l3',
      title: 'Letters K - O',
      subtitle: 'Complete previous lesson',
      isLocked: true,
    ),
    Lesson(
      id: 'l4',
      title: 'Letters P - T',
      subtitle: 'Complete previous lesson',
      isLocked: true,
    ),
    Lesson(
      id: 'l5',
      title: 'Final Assessment',
      subtitle: 'Test your alphabet knowledge',
      isLocked: true,
    ),
  ];

  static final List<DictionaryItem> dictionaryItems = [
    DictionaryItem(
      id: 'd1',
      word: 'Apple',
      category: 'Food',
      definition: 'Food • Fruit • Noun',
      videoUrl: AppConstants.sampleVideoThumbnail, // Using thumbnail as placeholder
      imageUrl: AppConstants.appleSign,
    ),
    DictionaryItem(
      id: 'd2',
      word: 'Burger',
      category: 'Food',
      definition: 'Food • Meal • Noun',
      videoUrl: AppConstants.sampleVideoThumbnail,
      imageUrl: AppConstants.burgerSign,
    ),
    DictionaryItem(
      id: 'd3',
      word: 'Water',
      category: 'Drink',
      definition: 'Drink • Liquid • Noun',
      videoUrl: AppConstants.sampleVideoThumbnail,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA3FAyCSwCenpZ3jiXWB0M-cCzH3v86YbHMM6GYgpaKq1qYWEoYK7ndSUosV8drL9lcfLqGydEp_IW3rpWyMLUPz9gYVywyFTkDIpthRF1g4ZMCqoyU4D3NZF4n3rsfOTQk0z9KOam0tiTxbhP0gw75u1Hv7MWQhGGv2yMa7RqM2TSX3lZ68SGyqjUR3SSQi7SY2eKxw-MJ5TEalchC5KX3kmROeHbFCnF_7IngyRfyTksa9NhNFh8EP5lGrs6GzHfDNXLz-6ojKsZT',
    ),
    DictionaryItem(
      id: 'd4',
      word: 'Bread',
      category: 'Food',
      definition: 'Food • Bakery • Noun',
      videoUrl: AppConstants.sampleVideoThumbnail,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBqVdy89V_HpEKqdH9_JttSDEnio2nJzswQ_mJoP6tv52ab3RZvNHFEa8t_reBaoLHfDg_iZxGJY4PKl6FR8tpIv76_rDXCbO-u2RZ7PGxtPBf63mkvpCai35NPWV8Tg1tAiBfN9LWDm2uwhBqw2nhdR5ERWa5ZGVUmhJ7Pi4iWt8iYD8j2aJYAsyebpYq9dE-3BwDHgb6fzHwjSGM67Xr0F4p5AK3BRbUrPoQWvJB59tt5bivrP4G3egF1wijinhPUJDzAS2hTqRpM',
    ),
    DictionaryItem(
      id: 'd5',
      word: 'Orange',
      category: 'Food',
      definition: 'Food • Fruit • Noun',
      videoUrl: AppConstants.sampleVideoThumbnail,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDkaKhKDLrOiKrfIn-rWhpQIAxkS5P_M6t-bdBHU_ReQJpJcPohrm7SXWnH1UarMm1b9M3yzn6mmirWHmosM8Yd34kh_Fj0pUWNz6ho-8RlsC7wpmqSwjmhipSYA5NvtgBpSDhx9BCBKURIEvRhwYIuA6URuViKUC8u7WpDLfkxRfhr8fSCG4Fx79lTxabZcLqJdkbyt0hfakBNgoq4mVjW9lNCBgaSornj_sG4JIZt9Y9mmBbzLmP8CWGaegbpng1taKjxT4rsSKJL',
    ),
  ];

  static final Quiz quizA = Quiz(
    id: 'q1',
    question: 'What does this sign mean?',
    videoUrl: AppConstants.teacherImageUrl, // Placeholder
    type: QuizType.videoToOptions,
    correctAnswerId: 'o2',
    options: [
      QuizOption(id: 'o1', text: 'Hello'),
      QuizOption(id: 'o2', text: 'Thank You'),
      QuizOption(id: 'o3', text: 'Hungry'),
      QuizOption(id: 'o4', text: 'Please'),
    ],
  );

  static final Quiz quizB = Quiz(
    id: 'q2',
    question: 'Which sign matches?',
    type: QuizType.wordMatch,
    correctAnswerId: 'o2',
    options: [
      QuizOption(id: 'o1', text: 'A', videoUrl: AppConstants.sampleVideoThumbnail),
      QuizOption(id: 'o2', text: 'B', videoUrl: AppConstants.sampleVideoThumbnail),
    ],
  );
}
