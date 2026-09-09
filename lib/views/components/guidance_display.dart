import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../models/tutor_guidance.dart';
import '../../theme/app_theme.dart';

/// Renders the AI-generated pedagogical guidance cards:
/// 1. Stanford NSSA Pedagogical Coaching Strategy
/// 2. Tailored Micro-Activity
/// 3. Exact Tutor Dialogue Script with 1-click clipboard copy
class GuidanceDisplay extends StatefulWidget {
  final TutorGuidance guidance;
  final VoidCallback onRegenerate;

  const GuidanceDisplay({
    super.key,
    required this.guidance,
    required this.onRegenerate,
  });

  @override
  State<GuidanceDisplay> createState() => _GuidanceDisplayState();
}

class _GuidanceDisplayState extends State<GuidanceDisplay> {
  bool _copied = false;

  Future<void> _copyScript() async {
    await Clipboard.setData(ClipboardData(text: widget.guidance.exactTutorScript));
    setState(() => _copied = true);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Text(
                'Copied tutor script for ${widget.guidance.studentName} to clipboard!',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          backgroundColor: AppTheme.emerald,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }

    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _copied = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final g = widget.guidance;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 1024;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.skyBlue.withValues(alpha: 0.3), width: 1.5),
        boxShadow: AppTheme.hoverShadow,
      ),
      padding: EdgeInsets.all(isDesktop ? 28 : 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppTheme.skyBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.smart_toy_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 8,
                            runSpacing: 4,
                            children: [
                              Text(
                                'AI Copilot Guidance for ${g.studentName}',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 7,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.emeraldLight,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  '⚡ ${g.latencyMs}ms',
                                  style: const TextStyle(
                                    color: Color(0xFF047857),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Scenario: ${g.momentTitle}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppTheme.textMuted,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Quick Refresh / Re-roll
              IconButton(
                onPressed: widget.onRegenerate,
                tooltip: 'Refresh Guidance',
                icon: const Icon(Icons.refresh, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: AppTheme.border, height: 1),
          const SizedBox(height: 24),

          // 3 Column Grid on Desktop, Vertical Stack on Mobile
          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildStrategyCard(g)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildActivityCard(g)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildScriptCard(g)),
                  ],
                )
              : Column(
                  children: [
                    _buildStrategyCard(g),
                    const SizedBox(height: 16),
                    _buildActivityCard(g),
                    const SizedBox(height: 16),
                    _buildScriptCard(g),
                  ],
                ),

          const SizedBox(height: 20),

          // Quick Formative Check-In Box
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.border),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppTheme.amberLight,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.help_outline,
                    color: AppTheme.amber,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Formative Check-In Question (Ask this before moving on):',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        g.quickCheckQuestion,
                        style: const TextStyle(
                          fontSize: 13.5,
                          fontStyle: FontStyle.italic,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.05, end: 0);
  }

  // 1. Pedagogical Strategy Card
  Widget _buildStrategyCard(TutorGuidance g) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.skyBlueLight.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.skyBlue.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.school, size: 18, color: AppTheme.skyBlue),
              const SizedBox(width: 8),
              const Text(
                'TUTOR COACHING TIP',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  color: AppTheme.skyBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            g.pedagogicalStrategyTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppTheme.skyBlue.withValues(alpha: 0.3)),
            ),
            child: Text(
              g.pedagogicalFrameworkTag,
              style: const TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w600,
                color: AppTheme.skyBlue,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            g.pedagogicalRationale,
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  // 2. Personalized Micro-Activity Card
  Widget _buildActivityCard(TutorGuidance g) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.amberLight.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.amber.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 6,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.videogame_asset_outlined,
                      size: 18, color: Color(0xFFD97706)),
                  const SizedBox(width: 6),
                  const Text(
                    'TAILORED ACTIVITY',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                      color: Color(0xFFD97706),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppTheme.amber.withValues(alpha: 0.4)),
                ),
                child: Text(
                  g.microActivityDuration,
                  style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFD97706),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            g.microActivityTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            g.microActivityInstructions,
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  // 3. Exact Tutor Dialogue Script Card with Copy Action
  Widget _buildScriptCard(TutorGuidance g) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.emeraldLight.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.emerald.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 6,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.record_voice_over_outlined,
                      size: 18, color: Color(0xFF047857)),
                  const SizedBox(width: 6),
                  const Text(
                    'EXACT TUTOR SCRIPT',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                      color: Color(0xFF047857),
                    ),
                  ),
                ],
              ),
              FilledButton.tonalIcon(
                onPressed: _copyScript,
                style: FilledButton.styleFrom(
                  backgroundColor: _copied ? AppTheme.emerald : Colors.white,
                  foregroundColor:
                      _copied ? Colors.white : const Color(0xFF047857),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: BorderSide(
                      color: _copied
                          ? AppTheme.emerald
                          : const Color(0xFF047857).withValues(alpha: 0.3),
                    ),
                  ),
                ),
                icon: Icon(
                  _copied ? Icons.check : Icons.copy,
                  size: 12,
                ),
                label: Text(
                  _copied ? 'Copied!' : 'Copy',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Word-for-Word Phrasing',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.emerald.withValues(alpha: 0.3)),
            ),
            child: Text(
              g.exactTutorScript,
              style: const TextStyle(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                height: 1.5,
                color: Color(0xFF064E3B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
