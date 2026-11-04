# Step Up Tutor Copilot

A Flutter Web prototype that helps volunteer tutors respond to common tutoring challenges with coaching tips, short activities, and suggested language.

**[Try the live demo](https://tinhorn.github.io/stepup-tutor-copilot/)**

Built independently by Fawaz Joseph while exploring the Step Up Tutoring Staff Engineer opportunity. This is a portfolio prototype, not an official Step Up Tutoring product.

## The problem

Volunteer tutors need to respond when a student gets stuck, loses confidence, or needs a different explanation. Finding an activity during a session can interrupt the conversation.

This prototype explores a simple workflow: select a student profile, choose the current session moment, and receive guidance that connects the learning challenge to the student’s interests.

## What you can try

Choose one of three fictional student profiles or enter a custom profile. Then select a session moment:

- Session kickoff
- Concept block
- Frustration or low confidence
- Wrap-up

The app presents a coaching tip and rationale, a short activity, suggested language with a copy button, and a comprehension check.

The **Behind the Build** panel explains the implementation choices.

## How it works

The app uses a deterministic, in-memory guidance engine. It combines profile information and session context with predefined strategies and templates.

**The running demo does not call an AI model.** AI tools assisted development, including implementation and test authoring. Guidance is generated locally rather than through an external inference service.

This approach keeps the demo accessible without API keys or a backend. It also limits the guidance to the scenarios and rules implemented in the prototype.

## Engineering decisions

### A focused prototype

Flutter Web provides an interactive demo that runs in a browser. A local guidance engine makes the core workflow easy to evaluate without account setup or infrastructure dependencies.

### Responsive interface

The interface uses `LayoutBuilder` and `MediaQuery` to adapt to different screen sizes. Guidance is organized into distinct sections so tutors can scan it during a session.

### Local processing

Student profile inputs are processed in browser memory by the guidance engine and are not sent to an external AI service. The prototype does not implement a backend database.

Use fictional information when exploring the demo. Local processing alone does not establish regulatory compliance.

### Automated deployment

GitHub Actions builds and deploys the application to GitHub Pages when changes are pushed to `main`.

## Technology

- Flutter and Dart
- `flutter_animate`
- Flutter unit and widget tests
- GitHub Actions
- GitHub Pages

## Testing

The repository includes:

- **Guidance engine tests:** predefined profiles and custom profile behavior.
- **Widget tests:** profile selection, session moment selection, guidance display, and the Behind the Build panel.

Run static analysis and tests:

```bash
flutter pub get
flutter analyze
flutter test
```

## Run locally

Install the Flutter SDK, then:

```bash
git clone https://github.com/Tinhorn/stepup-tutor-copilot.git
cd stepup-tutor-copilot
flutter pub get
flutter run -d chrome
```

Build for GitHub Pages:

```bash
flutter build web --release --base-href "/stepup-tutor-copilot/"
```

## Scope and limitations

This project demonstrates a product concept and its implementation. It has not been validated through classroom use or measured learning outcomes.

The guidance is template-based and does not evaluate student understanding. Tutors should review suggestions and adapt them to the student and context.

Authentication, persistent student records, live AI inference, and production monitoring are outside the current scope.

## Possible next steps

- Test the workflow with volunteer tutors and identify where guidance is useful or distracting.
- Review the content with experienced educators.
- Expand automated coverage for custom inputs and accessibility.
- Evaluate whether live AI inference improves guidance enough to justify its latency, cost, and privacy requirements.

## Inspiration and attribution

The concept draws on publicly available materials about high-impact tutoring from the [Stanford National Student Support Accelerator](https://studentsupportaccelerator.org/) and the [Stanford Accelerator for Learning](https://acceleratelearning.stanford.edu/).

These references do not imply affiliation, endorsement, or validation of the prototype.

## Author

**Fawaz Joseph**  
[GitHub](https://github.com/Tinhorn) · [LinkedIn](https://www.linkedin.com/in/fawazjoseph/)
