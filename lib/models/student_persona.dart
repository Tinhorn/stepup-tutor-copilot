import 'package:flutter/material.dart';

/// Represents an elementary student profile in Step Up Tutoring.
class StudentPersona {
  final String id;
  final String name;
  final int grade;
  final String learningChallenge;
  final String interest;
  final String avatarEmoji;
  final Color accentColor;
  final bool isCustom;

  const StudentPersona({
    required this.id,
    required this.name,
    required this.grade,
    required this.learningChallenge,
    required this.interest,
    required this.avatarEmoji,
    required this.accentColor,
    this.isCustom = false,
  });

  String get gradeLabel {
    switch (grade) {
      case 2:
        return '2nd Grade';
      case 3:
        return '3rd Grade';
      case 4:
        return '4th Grade';
      case 5:
        return '5th Grade';
      case 6:
        return '6th Grade';
      default:
        return 'Grade $grade';
    }
  }

  /// Default curated student personas for Step Up Tutoring
  static List<StudentPersona> get defaultPersonas => [
        const StudentPersona(
          id: 'maya',
          name: 'Maya',
          grade: 4,
          learningChallenge: 'Equivalent Fractions & Mixed Numbers',
          interest: 'Soccer & Penalty Shootouts',
          avatarEmoji: '⚽',
          accentColor: Color(0xFF0284C7), // Sky Blue
        ),
        const StudentPersona(
          id: 'marcus',
          name: 'Marcus',
          grade: 3,
          learningChallenge: 'Reading Stamina & Context Clues',
          interest: 'Dinosaurs & Prehistoric Fossils',
          avatarEmoji: '🦖',
          accentColor: Color(0xFF10B981), // Emerald
        ),
        const StudentPersona(
          id: 'elena',
          name: 'Elena',
          grade: 5,
          learningChallenge: 'Multi-digit Multiplication Anxiety',
          interest: 'Graphic Novels & Manga Drawing',
          avatarEmoji: '🎨',
          accentColor: Color(0xFF8B5CF6), // Purple
        ),
      ];
}

/// Represents the specific critical moment occurring in the tutoring session.
enum SessionMomentType {
  icebreaker,
  conceptBlock,
  frustration,
  wrapUp,
}

class SessionMoment {
  final SessionMomentType type;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const SessionMoment({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  static List<SessionMoment> get moments => const [
        SessionMoment(
          type: SessionMomentType.icebreaker,
          title: 'Session Kickoff',
          subtitle: 'Build rapport & activate prior knowledge',
          icon: Icons.waving_hand_outlined,
          color: Color(0xFFF59E0B), // Amber
        ),
        SessionMoment(
          type: SessionMomentType.conceptBlock,
          title: 'Concept Block',
          subtitle: 'Stuck on an abstract problem',
          icon: Icons.extension_outlined,
          color: Color(0xFF0284C7), // Sky Blue
        ),
        SessionMoment(
          type: SessionMomentType.frustration,
          title: 'Frustrated / Low Confidence',
          subtitle: 'Shuts down after repeated mistakes',
          icon: Icons.sentiment_dissatisfied_outlined,
          color: Color(0xFFF43F5E), // Rose
        ),
        SessionMoment(
          type: SessionMomentType.wrapUp,
          title: 'Wrap-Up & Growth',
          subtitle: 'Exit ticket & effort celebration',
          icon: Icons.military_tech_outlined,
          color: Color(0xFF10B981), // Emerald
        ),
      ];
}
