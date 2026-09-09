import 'package:flutter/material.dart';
import '../../models/student_persona.dart';
import '../../theme/app_theme.dart';
import 'custom_student_dialog.dart';

/// Card-based interactive persona selector allowing users to toggle between
/// Maya, Marcus, Elena, and any custom student profile.
class PersonaSelector extends StatelessWidget {
  final List<StudentPersona> personas;
  final StudentPersona selectedPersona;
  final ValueChanged<StudentPersona> onSelectPersona;
  final ValueChanged<StudentPersona> onAddCustomPersona;

  const PersonaSelector({
    super.key,
    required this.personas,
    required this.selectedPersona,
    required this.onSelectPersona,
    required this.onAddCustomPersona,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryNavy,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'STEP 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Select Student Persona',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            Text(
              'Click a student or create your own',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textMuted,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Grid / Wrap of Persona Cards
        LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = isDesktop
                ? (constraints.maxWidth - (3 * 16)) / 4
                : (constraints.maxWidth > 560
                    ? (constraints.maxWidth - 16) / 2
                    : constraints.maxWidth);

            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                ...personas.map((persona) {
                  final isSelected = persona.id == selectedPersona.id;
                  return SizedBox(
                    width: cardWidth,
                    child: _buildPersonaCard(
                      context,
                      persona: persona,
                      isSelected: isSelected,
                    ),
                  );
                }),

                // "+ Add Custom Student" Card
                SizedBox(
                  width: cardWidth,
                  child: _buildAddCustomCard(context),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildPersonaCard(
    BuildContext context, {
    required StudentPersona persona,
    required bool isSelected,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onSelectPersona(persona),
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.skyBlueLight.withValues(alpha: 0.3) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? AppTheme.skyBlue : AppTheme.border,
              width: isSelected ? 2.0 : 1.0,
            ),
            boxShadow: isSelected ? AppTheme.hoverShadow : AppTheme.subtleShadow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Avatar & Grade Pill
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: persona.accentColor.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        persona.avatarEmoji,
                        style: const TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppTheme.skyBlue
                          : AppTheme.background,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected
                            ? AppTheme.skyBlue
                            : AppTheme.border,
                      ),
                    ),
                    child: Text(
                      persona.gradeLabel,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? Colors.white
                            : AppTheme.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Name
              Row(
                children: [
                  Text(
                    persona.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                        ),
                  ),
                  if (persona.isCustom) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 1.5,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.amberLight,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Custom',
                        style: TextStyle(
                          color: AppTheme.amber,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 8),

              // Challenge Tag
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.trending_up,
                    size: 14,
                    color: Color(0xFFEF4444),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      persona.learningChallenge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),

              // Passion Tag
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.favorite,
                    size: 14,
                    color: Color(0xFF10B981),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      persona.interest,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddCustomCard(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          final customStudent = await showDialog<StudentPersona>(
            context: context,
            builder: (ctx) => const CustomStudentDialog(),
          );
          if (customStudent != null) {
            onAddCustomPersona(customStudent);
          }
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppTheme.border,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppTheme.amberLight,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: AppTheme.amber,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Custom Student',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                'Input any name, grade, & unique hobby',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 11,
                      color: AppTheme.textMuted,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
