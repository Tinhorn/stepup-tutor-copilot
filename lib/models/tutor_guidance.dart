/// Holds the structured AI guidance returned by the Copilot Engine.
class TutorGuidance {
  /// The first name of the student receiving guidance.
  final String studentName;

  /// The title of the session scenario or challenge moment.
  final String momentTitle;

  /// The headline title of the recommended pedagogical coaching technique.
  final String pedagogicalStrategyTitle;

  /// The research grounding tag (e.g., 'Stanford NSSA • Concrete-Representational-Abstract').
  final String pedagogicalFrameworkTag;

  /// The pedagogical explanation of why this specific intervention works.
  final String pedagogicalRationale;

  /// The title of the interest-matched micro-activity.
  final String microActivityTitle;

  /// The estimated time duration of the micro-activity (e.g., '3 minutes').
  final String microActivityDuration;

  /// Step-by-step instructions for the tutor to facilitate the activity.
  final String microActivityInstructions;

  /// Word-for-word empathetic tutor script with suggested phrasing.
  final String exactTutorScript;

  /// Formative check-in question to verify student comprehension.
  final String quickCheckQuestion;

  /// The generation latency in milliseconds.
  final int latencyMs;

  /// Creates a new [TutorGuidance] recommendation snapshot.
  const TutorGuidance({
    required this.studentName,
    required this.momentTitle,
    required this.pedagogicalStrategyTitle,
    required this.pedagogicalFrameworkTag,
    required this.pedagogicalRationale,
    required this.microActivityTitle,
    required this.microActivityDuration,
    required this.microActivityInstructions,
    required this.exactTutorScript,
    required this.quickCheckQuestion,
    this.latencyMs = 42,
  });
}
