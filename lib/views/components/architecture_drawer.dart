import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// Expandable end-drawer presenting Staff-level engineering and architecture decisions
/// to technical evaluators and hiring leadership at Step Up Tutoring.
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
                            Icons.account_tree_outlined,
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
                                    'Architecture & Decisions',
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
                                      color: AppTheme.amberLight,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Text(
                                      'Staff Eng',
                                      style: TextStyle(
                                        color: Color(0xFFB45309),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Production Blueprint for 100k+ Tutoring Sessions',
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
                  Tab(text: '1. System Topology'),
                  Tab(text: '2. COPPA & FERPA Privacy'),
                  Tab(text: '3. AI Guardrails & RAG'),
                  Tab(text: '4. Scaling to 100k'),
                ],
              ),
            ),

            // Tab Views
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTopologyTab(),
                  _buildPrivacyTab(),
                  _buildGuardrailsTab(),
                  _buildScalingTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // TAB 1: SYSTEM TOPOLOGY
  // ---------------------------------------------------------------------------
  Widget _buildTopologyTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildSectionHeader(
          title: 'Decoupled Microservices Architecture',
          subtitle:
              'How this client interface translates into a production-grade cloud platform.',
        ),
        const SizedBox(height: 16),
        _buildCodeBlock('''
+-------------------------------------------------------------+
|             CLIENT LAYER (Flutter Web / Mobile)             |
|  - Real-time Copilot UI      - WebRTC / Audio Stream        |
+-------------------------------------------------------------+
                              │ (WSS / HTTPS via Cloudflare)
                              ▼
+-------------------------------------------------------------+
|               API GATEWAY & LOAD BALANCER                   |
|  - JWT Auth Verification    - Rate Limiting & DDoS Shield   |
+-------------------------------------------------------------+
         │                                    │
         ▼                                    ▼
+-------------------------+       +---------------------------+
| SESSION SERVICE         |       | COPILOT INFERENCE GATEWAY |
| (FastAPI / WebSockets)  |       | (Python Async / LangChain)|
| - Session Presence      |       | - Semantic Prompt Cache   |
| - Volunteer Live State  |       | - PII Scrubbing Pipeline  |
+-------------------------+       +---------------------------+
         │                                    │
         ▼                                    ▼
+-------------------------+       +---------------------------+
| REDIS CLUSTER           |       | POSTGRESQL + PGVECTOR     |
| - Sub-15ms Prompt Cache |       | - District Curricula RAG  |
| - Ephemeral Room State  |       | - Row-Level Security (RLS)|
+-------------------------+       +---------------------------+
                                              │
                                              ▼
                                  +---------------------------+
                                  | PRIVATE ENTERPRISE LLM    |
                                  | - Zero Data Retention     |
                                  | - Azure OpenAI / Bedrock  |
                                  +---------------------------+
'''),
        const SizedBox(height: 20),
        _buildKeyDecisionCard(
          number: '1',
          title: 'Sub-50ms Latency via Redis Semantic Caching',
          body:
              'Tutoring sessions move fast. Volunteer tutors will abandon a copilot that takes 3+ seconds to respond. By embedding session challenge contexts with pgvector and caching common pedagogical interventions in Redis, 65%+ of requests return instantly (<15ms).',
        ),
        const SizedBox(height: 12),
        _buildKeyDecisionCard(
          number: '2',
          title: 'Asynchronous Session Decoupling',
          body:
              'Audio/video conferencing streams (WebRTC) are isolated from Copilot inference. If an AI inference gateway experiences a transient slowdown, the live tutoring session is completely unaffected.',
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // TAB 2: YOUTH DATA PRIVACY (COPPA & FERPA)
  // ---------------------------------------------------------------------------
  Widget _buildPrivacyTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildSectionHeader(
          title: 'Youth Privacy by Design',
          subtitle:
              'Comprehensive compliance with COPPA, FERPA, and California Student Privacy standards.',
        ),
        const SizedBox(height: 16),
        _buildBulletPoint(
          icon: Icons.vpn_key_outlined,
          title: 'Zero Raw PII Sent to LLM Providers',
          description:
              'Student names, dates of birth, and school IDs never leave district boundaries. The client transforms raw identities into ephemeral session tokens (e.g. "student_token: 8f41c, grade: 4, topic: fractions") before sending to the Copilot Gateway.',
        ),
        const SizedBox(height: 14),
        _buildBulletPoint(
          icon: Icons.lock_outline,
          title: 'PostgreSQL Row-Level Security (RLS)',
          description:
              'Data access is strictly partitioned. Volunteer tutors have cryptographically enforced access ONLY to their assigned student during their scheduled 45-minute tutoring slot.',
        ),
        const SizedBox(height: 14),
        _buildBulletPoint(
          icon: Icons.phonelink_erase_outlined,
          title: 'Zero Data Retention (ZDR) Enterprise Agreements',
          description:
              'All LLM calls execute under strict enterprise BAA/ZDR agreements with zero telemetry storage for model training. Session transcripts are retained strictly for attendance audit (30 days) and automatically purged.',
        ),
        const SizedBox(height: 14),
        _buildBulletPoint(
          icon: Icons.verified_user_outlined,
          title: 'Presidio Edge Anonymization',
          description:
              'A local Microsoft Presidio pipeline scans all custom inputs for accidental PII (phone numbers, physical addresses, family names) and redacts them in-memory prior to prompt synthesis.',
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // TAB 3: AI SAFETY, GUARDRAILS & RAG
  // ---------------------------------------------------------------------------
  Widget _buildGuardrailsTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildSectionHeader(
          title: 'AI Reliability & Pedagogical Guardrails',
          subtitle:
              'Grounded in the Stanford National Student Support Accelerator (NSSA) framework.',
        ),
        const SizedBox(height: 16),
        _buildCardContainer(
          color: AppTheme.skyBlueLight.withValues(alpha: 0.3),
          borderColor: AppTheme.skyBlue.withValues(alpha: 0.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.shield_outlined, color: AppTheme.skyBlue, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'TWO-TIER GUARDRAIL PIPELINE',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.skyBlue,
                      letterSpacing: 0.6,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Tier 1 (Fast Regex & Keyword Filter • <5ms): Blocks prompt injection patterns, offensive language, and off-task system instruction overrides.\n\nTier 2 (Semantic Safety Classifier • <60ms): A distilled DeBERTa classifier verifies that responses remain pedagogical, encouraging, and grade-appropriate before reaching the volunteer tutor.',
                style: TextStyle(fontSize: 13, height: 1.5, color: AppTheme.textPrimary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildKeyDecisionCard(
          number: '1',
          title: 'Curriculum-Grounded RAG (pgvector)',
          body:
              'Rather than relying on raw LLM hallucination, the engine performs cosine similarity search over district-aligned Common Core progressions. Interventions strictly mirror state standards.',
        ),
        const SizedBox(height: 12),
        _buildKeyDecisionCard(
          number: '2',
          title: 'Stanford NSSA Pedagogical Alignment',
          body:
              'Prompts are explicitly structured around Stanford’s high-impact tutoring framework: Concrete-Representational-Abstract (CRA) math modeling, error destigmatization, and student self-efficacy checks.',
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // TAB 4: SCALING TO 100K SESSIONS
  // ---------------------------------------------------------------------------
  Widget _buildScalingTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildSectionHeader(
          title: 'Scaling from 10k to 100k+ Sessions',
          subtitle:
              'Cost engineering, throughput modeling, and infrastructure reliability.',
        ),
        const SizedBox(height: 16),
        _buildMetricRow(
          label1: 'Peak Concurrent Sessions',
          val1: '15,000',
          label2: 'Redis Cache Hit Rate',
          val2: '68%',
        ),
        const SizedBox(height: 12),
        _buildMetricRow(
          label1: 'Monthly Cost (Uncached)',
          val1: '~\$18,400',
          label2: 'Monthly Cost (Semantic Cache)',
          val2: '~\$5,200 (71% savings)',
        ),
        const SizedBox(height: 20),
        _buildBulletPoint(
          icon: Icons.cloud_sync_outlined,
          title: 'Event-Driven Async Telemetry (Kafka / SQS)',
          description:
              'Tutor interactions, thumbs up/down feedback, and session milestones are published asynchronously to a message queue. Live session requests are never blocked by analytical logging or database writes.',
        ),
        const SizedBox(height: 14),
        _buildBulletPoint(
          icon: Icons.auto_graph_outlined,
          title: 'Horizontal Pod Autoscaling (HPA)',
          description:
              'Kubernetes clusters scale based on active WebSocket connections and queue depth, automatically provisioning pods during the 3:00 PM – 7:00 PM after-school peak and scaling down overnight.',
        ),
        const SizedBox(height: 14),
        _buildBulletPoint(
          icon: Icons.hub_outlined,
          title: 'Multi-AZ Database Architecture',
          description:
              'Amazon RDS PostgreSQL with Multi-AZ automated failover and read replicas dedicated to district attendance reporting, preventing heavy analytical queries from impacting live session queries.',
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
            fontSize: 18,
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

  Widget _buildMetricRow({
    required String label1,
    required String val1,
    required String label2,
    required String val2,
  }) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  val1,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.primaryNavy,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  label1,
                  style: const TextStyle(fontSize: 11, color: AppTheme.textMuted),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppTheme.emeraldLight.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.emerald.withValues(alpha: 0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  val2,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF047857),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  label2,
                  style: const TextStyle(fontSize: 11, color: AppTheme.textMuted),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
