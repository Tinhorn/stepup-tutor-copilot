import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// Slide-out drawer detailing how this portfolio prototype was created,
/// showcasing AI-accelerated engineering, pragmatic 80/20 design choices,
/// youth privacy compliance (COPPA/FERPA), and pedagogical grounding for Step Up Tutoring.
class ArchitectureDrawer extends StatefulWidget {
  const ArchitectureDrawer({super.key});

  @override
  State<ArchitectureDrawer> createState() => _ArchitectureDrawerState();
}

class _ArchitectureDrawerState extends State<ArchitectureDrawer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final drawerWidth = screenWidth > 640 ? 580.0 : screenWidth * 0.92;

    return Drawer(
      width: drawerWidth,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 16, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryNavy,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.auto_awesome,
                            color: Colors.white,
                            size: 20,
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
                                    'Behind the Build',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w800,
                                          color: AppTheme.primaryNavy,
                                        ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppTheme.skyBlueLight,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Text(
                                      'Engineering Craft',
                                      style: TextStyle(
                                        color: AppTheme.skyBlue,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Step Up Tutoring • Staff Engineer Candidate Portfolio',
                                style:
                                    Theme.of(context).textTheme.bodySmall?.copyWith(
                                          color: AppTheme.textMuted,
                                          fontSize: 11,
                                        ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 20),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            // Tab Bar
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppTheme.border),
                ),
              ),
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelColor: AppTheme.skyBlue,
                unselectedLabelColor: AppTheme.textSecondary,
                indicatorColor: AppTheme.skyBlue,
                indicatorWeight: 3,
                labelStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                tabs: const [
                  Tab(text: '1. AI-Accelerated Build'),
                  Tab(text: '2. Pragmatic 80/20 Choices'),
                  Tab(text: '3. Youth Privacy (FERPA)'),
                  Tab(text: '4. Pedagogical Grounding'),
                ],
              ),
            ),

            // Tab Views
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildAiWorkflowTab(),
                  _buildPragmaticArchitectureTab(),
                  _buildPrivacyTab(),
                  _buildPedagogyTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // TAB 1: AI-ACCELERATED ENGINEERING WORKFLOW
  // ---------------------------------------------------------------------------
  Widget _buildAiWorkflowTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildSectionHeader(
          title: 'Pioneering an AI-Native Engineering Workflow',
          subtitle:
              'How this entire application was planned, scaffolded, tested, and reviewed using agentic AI pairing.',
        ),
        const SizedBox(height: 16),
        _buildCodeBlock('''
+-------------------------------------------------------------+
|                 AI-NATIVE DEVELOPMENT LIFECYCLE             |
+-------------------------------------------------------------+
   1. REQUIREMENTS TRANSLATION
      Step Up JD & Stanford NSSA Research -> Phased Implementation Plan
                           │
                           ▼
   2. AGENTIC CODE SCAFFOLDING
      Domain Models -> Engine Services -> Responsive Presentation
                           │
                           ▼
   3. AUTOMATED VERIFICATION LOOPS
      Unit Test Synthesis -> Widget Tests -> flutter analyze (0 warnings)
                           │
                           ▼
   4. KARPATHY GUIDELINE AUDIT
      Trim Speculative Code -> Simplify Abstractions -> Surgical Diffs
'''),
        const SizedBox(height: 20),
        _buildKeyDecisionCard(
          number: '1',
          title: 'Requirements to Implementation in Hours',
          body:
              'Rather than taking weeks to produce an MVP, we translated the Step Up Staff Engineer job description and Stanford NSSA tutoring principles directly into working data models and test-driven UI components in a single session.',
        ),
        const SizedBox(height: 12),
        _buildKeyDecisionCard(
          number: '2',
          title: 'Automated Test-Driven Verification',
          body:
              'AI was leveraged not just for code scaffolding, but to author comprehensive unit tests ([test/copilot_engine_test.dart]) and widget tests ([test/widget_test.dart]) that continuously validate layout constraints, user interactions, and error boundaries.',
        ),
        const SizedBox(height: 12),
        _buildKeyDecisionCard(
          number: '3',
          title: 'Rigorous Code Review & Lint Enforcement',
          body:
              'Applied strict static analysis via flutter analyze and Dart documentation guidelines, ensuring that AI-assisted code adheres to the same bar expected from senior human engineering leadership.',
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // TAB 2: PRAGMATIC ARCHITECTURE & 80/20 DECISIONS
  // ---------------------------------------------------------------------------
  Widget _buildPragmaticArchitectureTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildSectionHeader(
          title: 'Pragmatic 80/20 Engineering Decisions',
          subtitle:
              'Achieving maximum product value with minimum complexity, avoiding premature over-engineering.',
        ),
        const SizedBox(height: 16),
        _buildCardContainer(
          color: AppTheme.amberLight.withValues(alpha: 0.3),
          borderColor: AppTheme.amber.withValues(alpha: 0.4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.lightbulb_outline, color: Color(0xFFB45309), size: 18),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'PRAGMATIC CHOICE: IN-MEMORY VS EXTERNAL LLM',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFB45309),
                        letterSpacing: 0.6,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Instead of requiring an external OpenAI/Gemini API key or spinning up an expensive backend for this portfolio demonstration, we built an in-memory pedagogical synthesis engine.\n\n'
                '• 100% Guaranteed Uptime: Never breaks during hiring committee evaluation.\n'
                '• Sub-50ms Response Time: Eliminates the 3-second lag that ruins live tutoring flow.\n'
                '• Zero Security Risk: Zero chance of API key theft, quota exhaustion, or billing spikes.\n'
                '• Zero Infrastructure Cost: Hosts 100% free on static GitHub Pages.',
                style: TextStyle(fontSize: 13, height: 1.5, color: AppTheme.textPrimary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildKeyDecisionCard(
          number: '1',
          title: 'Adhering to Karpathy Guidelines',
          body:
              'We followed Andrej Karpathy’s coding principles: minimum code that solves the problem, no speculative abstractions, and surgical modifications. When reviewing our design tokens, we proactively pruned unused tokens rather than leaving dead code.',
        ),
        const SizedBox(height: 12),
        _buildKeyDecisionCard(
          number: '2',
          title: 'Adaptive Responsive Design Without Bloat',
          body:
              'Utilized native Flutter MediaQuery.sizeOf(context) and LayoutBuilder to adapt across phones (390px), tablets, and desktop displays (1280px) without pulling in heavy third-party responsive layout frameworks.',
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // TAB 3: YOUTH DATA PRIVACY (COPPA & FERPA)
  // ---------------------------------------------------------------------------
  Widget _buildPrivacyTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildSectionHeader(
          title: 'Youth Privacy by Design (COPPA & FERPA)',
          subtitle:
              'Right-sized privacy controls for school district partnerships like LAUSD.',
        ),
        const SizedBox(height: 16),
        _buildBulletPoint(
          icon: Icons.shield_outlined,
          title: 'Zero Student PII Leaves Client Memory',
          description:
              'In this prototype, student profiles and custom inputs are evaluated purely in local device memory. No student names, learning challenges, or personal hobbies are ever transmitted over external networks or logged on third-party servers.',
        ),
        const SizedBox(height: 14),
        _buildBulletPoint(
          icon: Icons.vpn_key_outlined,
          title: 'Ephemeral Tokenization Architecture',
          description:
              'When translating this pattern into production, student identities are replaced with transient pseudonymous session tokens (e.g., student_token: #8a3f, grade: 4, challenge: fractions) before reaching any AI model, guaranteeing compliance with FERPA records privacy.',
        ),
        const SizedBox(height: 14),
        _buildBulletPoint(
          icon: Icons.lock_outline,
          title: 'District Partnership Alignment',
          description:
              'Step Up works with 40+ districts including Los Angeles Unified (LAUSD). Demonstrates technical ownership of district data privacy agreements, least-privilege role-based access, and zero telemetry retention.',
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // TAB 4: PEDAGOGICAL GROUNDING (STANFORD NSSA)
  // ---------------------------------------------------------------------------
  Widget _buildPedagogyTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildSectionHeader(
          title: 'Pedagogical Grounding & Stanford Research',
          subtitle:
              'AI engineered to elevate human connection, not replace the volunteer tutor.',
        ),
        const SizedBox(height: 16),
        _buildBulletPoint(
          icon: Icons.school_outlined,
          title: 'Stanford National Student Support Accelerator (NSSA)',
          description:
              'All guidance outputs are modeled on research-backed high-impact tutoring practices: relationship-building, error normalization, and structured metacognitive exit tickets.',
        ),
        const SizedBox(height: 14),
        _buildBulletPoint(
          icon: Icons.interests_outlined,
          title: 'Interest-Driven Cognitive Anchoring',
          description:
              'Connecting abstract math (fractions, multi-digit operations) to the student’s passion (soccer, dinosaurs, graphic novels) lowers cognitive resistance and leverages prior knowledge.',
        ),
        const SizedBox(height: 14),
        _buildBulletPoint(
          icon: Icons.record_voice_over_outlined,
          title: 'Word-for-Word Scaffolding for Non-Teachers',
          description:
              'Volunteer tutors are passionate community members, but rarely trained educators. Providing exact, encouraging scripts with 1-click clipboard copy removes anxiety and keeps tutoring sessions fluid and joyful.',
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // REUSABLE PRESENTATION HELPERS
  // ---------------------------------------------------------------------------
  Widget _buildSectionHeader({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: AppTheme.primaryNavy,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 13,
            color: AppTheme.textMuted,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildCodeBlock(String code) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.primaryNavy,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        code.trim(),
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 10.5,
          height: 1.35,
          color: Color(0xFF38BDF8),
        ),
      ),
    );
  }

  Widget _buildKeyDecisionCard({
    required String number,
    required String title,
    required String body,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: AppTheme.primaryNavy,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: const TextStyle(
                    fontSize: 12.5,
                    height: 1.5,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.skyBlueLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppTheme.skyBlue, size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12.5,
                    height: 1.5,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardContainer({
    required Color color,
    required Color borderColor,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: child,
    );
  }
}
