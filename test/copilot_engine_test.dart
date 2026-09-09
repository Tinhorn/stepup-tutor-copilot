import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_copilot/models/student_persona.dart';
import 'package:tutor_copilot/services/copilot_engine.dart';

void main() {
  group('CopilotEngine Unit Tests', () {
    test('generates soccer fraction guidance for Maya on concept block', () {
      final maya = StudentPersona.defaultPersonas.firstWhere((p) => p.id == 'maya');
      final guidance = CopilotEngine.generateGuidance(
        persona: maya,
        momentType: SessionMomentType.conceptBlock,
      );

      expect(guidance.studentName, equals('Maya'));
      expect(guidance.pedagogicalStrategyTitle, contains('CRA'));
      expect(guidance.microActivityTitle, contains('Soccer'));
      expect(guidance.exactTutorScript, contains('soccer field'));
      expect(guidance.latencyMs, lessThan(100));
    });

    test('generates dinosaur reading guidance for Marcus on kickoff', () {
      final marcus = StudentPersona.defaultPersonas.firstWhere((p) => p.id == 'marcus');
      final guidance = CopilotEngine.generateGuidance(
        persona: marcus,
        momentType: SessionMomentType.icebreaker,
      );

      expect(guidance.studentName, equals('Marcus'));
      expect(guidance.exactTutorScript, contains('Dr. Marcus'));
      expect(guidance.exactTutorScript, contains('dinosaur'));
    });

    test('generates comic graphic novel guidance for Elena on multiplication', () {
      final elena = StudentPersona.defaultPersonas.firstWhere((p) => p.id == 'elena');
      final guidance = CopilotEngine.generateGuidance(
        persona: elena,
        momentType: SessionMomentType.conceptBlock,
      );

      expect(guidance.studentName, equals('Elena'));
      expect(guidance.microActivityTitle, contains('Area Model'));
      expect(guidance.exactTutorScript, contains('comic'));
    });

    test('synthesizes custom guidance for custom persona correctly', () {
      const customPersona = StudentPersona(
        id: 'custom_123',
        name: 'Liam',
        grade: 2,
        learningChallenge: 'Phonics Blends',
        interest: 'LEGO Robotics',
        avatarEmoji: '🤖',
        accentColor: Colors.teal,
        isCustom: true,
      );

      final guidance = CopilotEngine.generateGuidance(
        persona: customPersona,
        momentType: SessionMomentType.icebreaker,
      );

      expect(guidance.studentName, equals('Liam'));
      expect(guidance.microActivityTitle, contains('LEGO Robotics'));
      expect(guidance.pedagogicalRationale, contains('Phonics Blends'));
      expect(guidance.exactTutorScript, contains('Liam'));
      expect(guidance.exactTutorScript, contains('LEGO Robotics'));
    });
  });
}
