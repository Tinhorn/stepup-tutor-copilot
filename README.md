# Step Up Tutor Copilot

> **AI-Powered Session Companion for Volunteer Tutors**  
> *Built for the Step Up Tutoring Staff Engineer Candidacy Review*  
> **Live Web Application:** [https://tinhorn.github.io/stepup-tutor-copilot/](https://tinhorn.github.io/stepup-tutor-copilot/)

---

## 🌟 The Mission & Problem Space

[Step Up Tutoring](https://www.stepuptutoring.org/) pairs dedicated volunteer tutors with elementary school students (grades 2–6) who need extra academic and emotional support.

During live 45-minute tutoring sessions, volunteers face real-world friction:
- **Pedagogical Gap:** Volunteer tutors are passionate community members, but rarely credentialed educators. When a 4th grader hits a cognitive block on equivalent fractions or shuts down in frustration, tutors need immediate, research-backed coaching without leaving the screen.
- **Student Affective Safety:** Students struggling in math and reading often experience test anxiety or low self-efficacy. They need low-stakes analogies connecting their personal passions (soccer, dinosaurs, graphic novels) to the academic concept.
- **Technology Supporting Human Connection:** As highlighted by the [Stanford Accelerator for Learning](https://acceleratelearning.stanford.edu/), technology must elevate and scaffold the human tutor-student bond—never displace it.

**Step Up Tutor Copilot** provides instantaneous, interest-tailored pedagogical scaffolding to empower volunteer tutors right when it matters most.

---

## 🚀 Key Features

```
+-----------------------------------------------------------------------+
|  STEP UP TUTOR COPILOT                       [ Behind the Build ✨ ]  |
|  AI Session Companion for Volunteer Tutors                            |
+-----------------------------------------------------------------------+
|                                                                       |
|  STEP 1: SELECT STUDENT PERSONA                                       |
|  [ Maya (4th Gr - Soccer) ]  [ Marcus (3rd Gr - Dinosaurs) ]  [ Custom ]|
|                                                                       |
|  STEP 2: WHAT IS HAPPENING IN THE SESSION?                            |
|  [ Session Kickoff ]  [ Concept Block ]  [ Frustrated ]  [ Wrap-Up ]  |
|                                                                       |
|  [ Generate Tutor Guidance ✨ ]                                        |
|                                                                       |
+-----------------------------------------------------------------------+
|  AI COPILOT GUIDANCE (⚡ 42ms)                                         |
|  ┌───────────────────────┐ ┌──────────────────────┐ ┌───────────────┐ |
|  │  TUTOR COACHING TIP   │ │  TAILORED ACTIVITY   │ │  EXACT SCRIPT  │ |
|  │  Stanford NSSA • CRA  │ │ Soccer field pitch   │ │ "Let's pause..."|
|  │  Visual Manipulatives │ │ 3 minutes            │ │ [ Copy Script ]│ |
|  └───────────────────────┘ └──────────────────────┘ └───────────────┘ |
+-----------------------------------------------------------------------+
```

### 1. Student Personas
* **Maya (Grade 4):** Equivalent fractions and mixed numbers • Passionate about soccer and penalty kicks.
* **Marcus (Grade 3):** Reading stamina, context clues, multi-syllable decoding • Loves dinosaurs and prehistoric fossils.
* **Elena (Grade 5):** Multi-digit multiplication anxiety • Loves drawing graphic novels and manga storyboards.
* **Custom Student Mode:** Staff and evaluators can input any student name, grade level (2–6), academic challenge, and personal hobby for instant dynamic synthesis.

### 2. Critical Session Moments
* **Session Kickoff:** Low-stakes rapport building and prior knowledge activation.
* **Concept Block:** Overcoming cognitive walls via Concrete-Representational-Abstract (CRA) modeling.
* **Frustrated / Low Confidence:** Normalizing productive struggle and reframing mistakes without judgment.
* **Wrap-Up & Growth Celebration:** Metacognitive exit tickets cementing progress and student self-efficacy.

### 3. Three-Pillar Guidance Display
* **Coaching Tip & Rationale:** Explains *why* the strategy works, grounded in the Stanford National Student Support Accelerator (NSSA) framework.
* **Tailored Micro-Activity:** A 3-minute interactive exercise linking the academic challenge to the student's unique interest.
* **Word-for-Word Script:** Exact empathetic phrasing with a **1-click clipboard copy** button for effortless delivery.
* **Formative Check-In Question:** A quick comprehension check for the tutor to ask before moving forward.

---

## 🛠️ Behind the Build: Engineering Craft & Decisions

An expandable **"Behind the Build"** drawer is built directly into the app header, detailing the engineering decisions aligned with the [Step Up Tutoring Staff Engineer Job Description](https://docs.google.com/document/d/1lVeB92fSSodelxLUuG34c-jlhapeU5l1RQI5hFXZABM/edit?tab=t.0#heading=h.r9i7gokn4w40):

### 1. Pioneering an AI-Accelerated Engineering Workflow
* **Requirements to Delivery:** Translated the Staff Engineer job description and Stanford NSSA research into working data models, domain engines, and test-driven UI components in a single session.
* **Automated Verification:** Leveraged AI not just for code scaffolding, but to author comprehensive unit and widget tests (`test/copilot_engine_test.dart` and `test/widget_test.dart`).
* **Continuous Quality:** 100% clean static analysis via `flutter analyze` and Effective Dart documentation standards.

### 2. Pragmatic 80/20 Architecture & Karpathy Guidelines
* **Deterministic In-Memory Synthesis Engine:** Rather than introducing a brittle third-party API wrapper requiring live OpenAI/Gemini API keys, the prototype uses an in-memory pedagogical engine with dynamic synthesis:
  * **100% Guaranteed Uptime:** Never fails during hiring committee evaluation.
  * **Sub-50ms Latency:** Instant response time (essential for live tutoring sessions).
  * **Zero Security Risk:** Zero chance of API key leakage or billing spikes.
  * **Zero Infrastructure Cost:** Deployed 100% free on GitHub Pages.
* **Karpathy Guidelines Adherence:** Minimum code that solves the problem, surgical diffs, and proactive pruning of dead code and unused design tokens.

### 3. Youth Data Privacy by Design (COPPA & FERPA)
* **Zero PII Transmission:** Student profiles and custom inputs are evaluated purely in local memory—no names, grades, or personal hobbies leave client device boundaries.
* **District Partnership Alignment:** Aligned with district privacy requirements (e.g. LAUSD), least-privilege access, and zero data retention for AI model training.

### 4. Pedagogical Grounding
* Grounded in the **Stanford National Student Support Accelerator (NSSA)** high-impact tutoring framework.
* Focuses on empowering the human volunteer tutor with confidence and empathy.

---

## 💻 Tech Stack & Architecture

* **Framework:** Flutter Web 3.44.4 (Dart 3.12.2)
* **Design System:** Custom Step Up palette (Deep Navy `#0F172A`, Sky Blue `#0284C7`, Warm Amber `#F59E0B`), Google Fonts (Outfit & Inter), subtle box shadows, and responsive layout constraints (`MediaQuery.sizeOf(context)` & `LayoutBuilder`).
* **Animations:** `flutter_animate` for tactile micro-interactions.
* **CI/CD:** Automated GitHub Actions workflow (`.github/workflows/deploy.yml`) on push to `main`.
* **Hosting:** GitHub Pages with subpath routing (`--base-href "/stepup-tutor-copilot/"`).

---

## 🧪 Testing & Verification

Run the test suite locally:

```bash
# Run static analysis (0 warnings/errors)
flutter analyze

# Run unit & widget tests (5/5 passing)
flutter test
```

### Test Coverage Highlights
* **`test/copilot_engine_test.dart`:** Validates pedagogical guidance transformations for Maya (soccer fractions), Marcus (dinosaur reading), Elena (comic multiplication), and custom student dynamic synthesis.
* **`test/widget_test.dart`:** Validates responsive UI rendering, student persona selection, session moment switching, guidance display cards, and opening the Behind the Build drawer with tab navigation.

---

## 🏃 Getting Started Locally

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Tinhorn/stepup-tutor-copilot.git
   cd stepup-tutor-copilot
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run in Chrome:**
   ```bash
   flutter run -d chrome
   ```
   *Or open with VS Code and select the **"Flutter Web (Chrome)"** debug configuration from `.vscode/launch.json`.*

4. **Build production release bundle:**
   ```bash
   flutter build web --release --base-href "/stepup-tutor-copilot/"
   ```

---

## 📄 License & Attribution

Built by **Fawaz Joseph** for the **Step Up Tutoring Staff Engineer** candidacy review.  
Educational frameworks inspired by the [Stanford National Student Support Accelerator](https://studentsupportaccelerator.org/) and [Stanford Accelerator for Learning](https://acceleratelearning.stanford.edu/).
