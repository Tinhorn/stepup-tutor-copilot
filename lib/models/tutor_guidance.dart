/// Holds the structured AI guidance returned by the Copilot Engine.
class TutorGuidance {
  final String studentName;
  final String momentTitle;
  final String pedagogicalStrategyTitle;
  final String pedagogicalFrameworkTag; // e.g., "Stanford NSSA • Concrete-Representational-Abstract"
  final String pedagogicalRationale;
  final String microActivityTitle;
  final String microActivityDuration;
  final String microActivityInstructions;
  final String exactTutorScript;
  final String quickCheckQuestion;
  final int latencyMs;

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
