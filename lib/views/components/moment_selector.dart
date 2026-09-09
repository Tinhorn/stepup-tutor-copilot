import 'package:flutter/material.dart';
import '../../models/student_persona.dart';
import '../../theme/app_theme.dart';

/// Interactive selector for the 4 tutoring session moments.
class MomentSelector extends StatelessWidget {
  final SessionMomentType selectedMoment;
  final ValueChanged<SessionMomentType> onSelectMoment;

  const MomentSelector({
    super.key,
    required this.selectedMoment,
    required this.onSelectMoment,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
                    'STEP 2',
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
                  'What is Happening in the Session?',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            Text(
              'Select a real-time teaching scenario',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textMuted,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = isDesktop
                ? (constraints.maxWidth - (3 * 12)) / 4
                : (constraints.maxWidth > 560
                    ? (constraints.maxWidth - 12) / 2
                    : constraints.maxWidth);

            return Wrap(
              spacing: 12,
              runSpacing: 12,
              children: SessionMoment.moments.map((moment) {
                final isSelected = moment.type == selectedMoment;
                return SizedBox(
                  width: cardWidth,
                  child: _buildMomentCard(
                    context,
                    moment: moment,
                    isSelected: isSelected,
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMomentCard(
    BuildContext context, {
    required SessionMoment moment,
    required bool isSelected,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onSelectMoment(moment.type),
        borderRadius: BorderRadius.circular(14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isSelected ? moment.color.withValues(alpha: 0.08) : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? moment.color : AppTheme.border,
              width: isSelected ? 2.0 : 1.0,
            ),
            boxShadow: isSelected ? AppTheme.hoverShadow : AppTheme.subtleShadow,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: isSelected
                      ? moment.color
                      : moment.color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    moment.icon,
                    size: 20,
                    color: isSelected ? Colors.white : moment.color,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      moment.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: isSelected ? AppTheme.textPrimary : AppTheme.textPrimary,
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      moment.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 11,
                            color: AppTheme.textMuted,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
