import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';

/// The primary workspace screen for Step Up Tutor Copilot.
/// Houses the header, hero section, interactive copilot workspace,
/// and the expandable Architecture & Systems Design panel.
class CopilotScreen extends StatefulWidget {
  const CopilotScreen({super.key});

  @override
  State<CopilotScreen> createState() => _CopilotScreenState();
}

class _CopilotScreenState extends State<CopilotScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppTheme.background,
      endDrawer: _buildArchitectureDrawerPlaceholder(),
      body: CustomScrollView(
        slivers: [
          // Top Navigation Bar
          SliverToBoxAdapter(
            child: _buildTopNavBar(isDesktop: isDesktop),
          ),

          // Hero Section
          SliverToBoxAdapter(
            child: _buildHeroSection(isDesktop: isDesktop, isTablet: isTablet),
          ),

          // Main Interactive Workspace Container
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1280),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 32 : 16,
                    vertical: 24,
                  ),
                  child: _buildWorkspacePlaceholder(isDesktop: isDesktop),
                ),
              ),
            ),
          ),

          // Footer / Attribution
          SliverToBoxAdapter(
            child: _buildFooter(),
          ),
        ],
      ),
    );
  }

  /// Top branded navigation bar
  Widget _buildTopNavBar({required bool isDesktop}) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppTheme.border, width: 1),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 32 : 16,
        vertical: 14,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Brand Logo & Title
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppTheme.skyBlue, Color(0xFF0284C7)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.skyBlue.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            'STEP UP',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppTheme.primaryNavy,
                                  letterSpacing: 0.5,
                                ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.skyBlueLight,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'COPILOT',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: AppTheme.skyBlue,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.8,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'AI Session Companion for Volunteer Tutors',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppTheme.textMuted,
                              fontSize: 11,
                            ),
                      ),
                    ],
                  ),
                ],
              ),

              // Action button to open Architecture & Systems Design panel
              FilledButton.tonalIcon(
                onPressed: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                },
                style: FilledButton.styleFrom(
                  backgroundColor: AppTheme.primaryNavy,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 16 : 12,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.account_tree_outlined, size: 18),
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isDesktop ? 'Architecture & Decisions' : 'Architecture',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (isDesktop) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 1.5,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.amber,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Staff Eng',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Hero section setting the context for evaluators
  Widget _buildHeroSection({required bool isDesktop, required bool isTablet}) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppTheme.border, width: 1),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 32 : 20,
        vertical: isDesktop ? 40 : 28,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Badge pill
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.amberLight,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppTheme.amber.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.school_outlined,
                      size: 15,
                      color: Color(0xFFB45309),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Step Up Tutoring • Staff Engineer Technical Portfolio',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: const Color(0xFFB45309),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                          ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.2, end: 0),

              const SizedBox(height: 16),

              // Main Headline
              Text(
                'Empower Every Tutoring Moment with AI Guidance',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: isDesktop ? 38 : (isTablet ? 30 : 24),
                      height: 1.2,
                    ),
              ).animate().fadeIn(duration: 500.ms, delay: 100.ms),

              const SizedBox(height: 14),

              // Subhead description
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 780),
                child: Text(
                  'Instant pedagogical scaffolding and interest-matched interventions for volunteer tutors working with 2nd–6th grade learners. Grounded in the Stanford NSSA high-impact tutoring model.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: isDesktop ? 16 : 14.5,
                        color: AppTheme.textSecondary,
                      ),
                ),
              ).animate().fadeIn(duration: 500.ms, delay: 200.ms),

              const SizedBox(height: 24),

              // Trust & Architecture Feature Badges
              Wrap(
                spacing: 12,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  _buildPillBadge(
                    icon: Icons.psychology_outlined,
                    label: 'Stanford NSSA Framework',
                    color: AppTheme.skyBlue,
                    bgColor: AppTheme.skyBlueLight,
                  ),
                  _buildPillBadge(
                    icon: Icons.shield_outlined,
                    label: 'COPPA & FERPA Youth Privacy',
                    color: AppTheme.emerald,
                    bgColor: AppTheme.emeraldLight,
                  ),
                  _buildPillBadge(
                    icon: Icons.bolt_outlined,
                    label: 'Zero-Latency Dynamic Engine',
                    color: AppTheme.amber,
                    bgColor: AppTheme.amberLight,
                  ),
                  _buildPillBadge(
                    icon: Icons.layers_outlined,
                    label: 'Scales to 100k+ Sessions',
                    color: AppTheme.violet,
                    bgColor: AppTheme.violetLight,
                  ),
                ],
              ).animate().fadeIn(duration: 500.ms, delay: 300.ms),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPillBadge({
    required IconData icon,
    required String label,
    required Color color,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// Workspace container placeholder for Phase 1
  Widget _buildWorkspacePlaceholder({required bool isDesktop}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.border),
        boxShadow: AppTheme.subtleShadow,
      ),
      padding: EdgeInsets.all(isDesktop ? 32 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppTheme.skyBlueLight,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.dashboard_customize_outlined,
                    color: AppTheme.skyBlue,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Interactive Tutor Copilot Workspace',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Phase 1 foundation ready • Phase 2 components will wire here',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppTheme.textMuted,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.border, strokeAlign: BorderSide.strokeAlignCenter),
            ),
            child: Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.tune,
                    size: 36,
                    color: AppTheme.skyBlue,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Workspace Scaffolding Initialized',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Select a student persona and session moment to generate tailored pedagogical interventions, games, and tutor scripts.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Drawer placeholder ready for Phase 3
  Widget _buildArchitectureDrawerPlaceholder() {
    return Drawer(
      width: 480,
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'System Architecture',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const Divider(color: AppTheme.border),
              const SizedBox(height: 16),
              Text(
                'Phase 3 will populate this panel with full Staff-level architecture diagrams, COPPA/FERPA security specifications, and 100k session scale blueprints.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Branded footer
  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      color: Colors.white,
      child: Center(
        child: Text(
          'Step Up Tutor Copilot • Built for Step Up Tutoring Staff Engineer Review • 2026',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.textMuted,
                fontSize: 12,
              ),
        ),
      ),
    );
  }
}
