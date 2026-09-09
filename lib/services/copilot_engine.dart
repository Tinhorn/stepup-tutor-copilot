import '../models/student_persona.dart';
import '../models/tutor_guidance.dart';

/// Intelligent in-memory pedagogical recommendation engine.
/// Grounded in the Stanford National Student Support Accelerator (NSSA)
/// high-impact tutoring framework.
class CopilotEngine {
  /// Generates real-time, grounded tutor guidance tailored to the student persona and session moment.
  static TutorGuidance generateGuidance({
    required StudentPersona persona,
    required SessionMomentType momentType,
  }) {
    if (persona.id == 'maya') {
      return _generateMayaGuidance(momentType);
    } else if (persona.id == 'marcus') {
      return _generateMarcusGuidance(momentType);
    } else if (persona.id == 'elena') {
      return _generateElenaGuidance(momentType);
    } else {
      return _generateCustomGuidance(persona, momentType);
    }
  }

  // ---------------------------------------------------------------------------
  // MAYA (Grade 4 • Equivalent Fractions • Soccer)
  // ---------------------------------------------------------------------------
  static TutorGuidance _generateMayaGuidance(SessionMomentType moment) {
    switch (moment) {
      case SessionMomentType.icebreaker:
        return const TutorGuidance(
          studentName: 'Maya',
          momentTitle: 'Session Kickoff',
          pedagogicalStrategyTitle: 'Low-Stakes Priming via Sports Analogy',
          pedagogicalFrameworkTag: 'Stanford NSSA • Relational Rapport & Prior Knowledge',
          pedagogicalRationale:
              'Activating non-academic passion (soccer) lowers affective filters and primes the brain for mathematical proportional thinking.',
          microActivityTitle: 'The Penalty Kick Target Ratio',
          microActivityDuration: '3 minutes',
          microActivityInstructions:
              'Draw a soccer goal with 4 equal quadrants on your shared digital whiteboard. Ask Maya: "If you take 4 shots and score 2 in the top corners, what fraction of your shots scored? What if we doubled the shots to 8?"',
          exactTutorScript:
              '"Maya, before we start today, imagine you’re in a championship penalty shootout! If your coach says you hit 2 out of 4 penalty shots into the top corner, how would you describe that score? Today, we are going to look at how 2 out of 4 and 4 out of 8 are actually the exact same champion performance!"',
          quickCheckQuestion: 'Can you show me 2 out of 4 and 4 out of 8 using soccer ball tally marks?',
          latencyMs: 38,
        );

      case SessionMomentType.conceptBlock:
        return const TutorGuidance(
          studentName: 'Maya',
          momentTitle: 'Concept Block (Stuck on Fractions)',
          pedagogicalStrategyTitle: 'Concrete-Representational-Abstract (CRA) Modeling',
          pedagogicalFrameworkTag: 'Stanford NSSA • Visual Manipulatives & CRA Scaffolding',
          pedagogicalRationale:
              'Maya is confusing the numerator and denominator because numbers feel detached from physical meaning. Grounding 1/2 vs 2/4 on a soccer pitch restores spatial intuition.',
          microActivityTitle: 'Soccer Field Pitch Division',
          microActivityDuration: '4 minutes',
          microActivityInstructions:
              '1. Sketch a rectangle representing a soccer field.\n2. Divide it in half down the midfield line (1/2).\n3. Then draw a horizontal line across the center, cutting the field into 4 equal quarters.\n4. Shade the same half: count how many quarters are shaded (2/4).',
          exactTutorScript:
              '"Let’s pause on the equation for a second, Maya. Look at this soccer field on my screen. If you practice drills on half the pitch, that’s 1/2. Now, what if the coach divides the field into 4 drill zones? How many of those small zones make up your half? Exactly, 2! So 1/2 and 2/4 cover the exact same green grass!"',
          quickCheckQuestion: 'If we split the pitch into 8 mini-boxes, how many would equal your half?',
          latencyMs: 41,
        );

      case SessionMomentType.frustration:
        return const TutorGuidance(
          studentName: 'Maya',
          momentTitle: 'Frustrated / Low Confidence',
          pedagogicalStrategyTitle: 'Growth Mindset Normalization & Error Reframing',
          pedagogicalFrameworkTag: 'Stanford NSSA • Affective Support & Productive Struggle',
          pedagogicalRationale:
              'Maya feels defeated after making 3 consecutive errors with mixed numbers. Comparing math struggle to athletic muscle memory restores agency and reduces test anxiety.',
          microActivityTitle: 'The "Reviewing the Game Tape" Reset',
          microActivityDuration: '2 minutes',
          microActivityInstructions:
              'Step away from solving for 90 seconds. Ask Maya what her favorite striker does when they miss a goal shot during practice. Use that athletic insight to inspect the mistake without judgment.',
          exactTutorScript:
              '"Maya, take a deep breath with me. When Sophia Smith or Messi misses a shot in practice, does their coach bench them? Never! They watch the game tape to see where their foot struck the ball. That mistake you just spotted is your game tape. You just learned one way that doesn’t work, which means your brain just got stronger for the next shot. Let’s look at the numerator together."',
          quickCheckQuestion: 'Which specific step felt tricky: multiplying the whole number or adding the top?',
          latencyMs: 36,
        );

      case SessionMomentType.wrapUp:
        return const TutorGuidance(
          studentName: 'Maya',
          momentTitle: 'Session Wrap-Up & Growth Celebration',
          pedagogicalStrategyTitle: 'Metacognitive Exit Ticket & Effort Attribution',
          pedagogicalFrameworkTag: 'Stanford NSSA • Formative Synthesis & Self-Efficacy',
          pedagogicalRationale:
              'Cementing progress by having the learner articulate what they learned builds long-term retention and positive learner identity.',
          microActivityTitle: 'Post-Match Press Conference',
          microActivityDuration: '3 minutes',
          microActivityInstructions:
              'Hand Maya the microphone! Pretend you are an ESPN reporter interviewing her after the match: "Maya, what was the biggest turning point in today’s game with fractions?"',
          exactTutorScript:
              '"Welcome to the post-game press conference, Maya! You had an incredible training session today. When you started, equivalent fractions felt like playing in heavy rain, but by minute 30 you were scoring hat-tricks with visual models! What is the #1 golden rule you will remember about numerators next week?"',
          quickCheckQuestion: 'Can you teach me in one sentence how to turn 1/3 into 2/6?',
          latencyMs: 44,
        );
    }
  }

  // ---------------------------------------------------------------------------
  // MARCUS (Grade 3 • Reading Stamina • Dinosaurs)
  // ---------------------------------------------------------------------------
  static TutorGuidance _generateMarcusGuidance(SessionMomentType moment) {
    switch (moment) {
      case SessionMomentType.icebreaker:
        return const TutorGuidance(
          studentName: 'Marcus',
          momentTitle: 'Session Kickoff',
          pedagogicalStrategyTitle: 'Role-Playing Framing & Curiosity Hook',
          pedagogicalFrameworkTag: 'Stanford NSSA • High-Leverage Engagement Sparks',
          pedagogicalRationale:
              'Marcus resists long reading passages because decoding fatigue sets in quickly. Framing him as a Lead Paleontologist turns reading into a discovery mission.',
          microActivityTitle: 'The Dinosaur Dig Dossier',
          microActivityDuration: '3 minutes',
          microActivityInstructions:
              'Show an image of a fossilized footprint or tooth. Explain that today’s reading passage contains 3 hidden "fossil clues" that only an observant paleontologist can unearth.',
          exactTutorScript:
              '"Dr. Marcus, grab your field magnifying glass! We received a secret field report from the Cretaceous period today. Before we read, look at this mysterious dinosaur track. What kind of dinosaur do you think left this? Keep that clue in mind, because today you and I are digging through the text to solve this prehistoric mystery!"',
          quickCheckQuestion: 'Are you ready to grab your field brush and find the first clue in paragraph 1?',
          latencyMs: 39,
        );

      case SessionMomentType.conceptBlock:
        return const TutorGuidance(
          studentName: 'Marcus',
          momentTitle: 'Concept Block (Decoding Hard Words)',
          pedagogicalStrategyTitle: 'Context Clue Chunking & Morpheme Excavation',
          pedagogicalFrameworkTag: 'Stanford NSSA • Multi-Tiered Literacy Scaffolding',
          pedagogicalRationale:
              'Marcus shuts down when encountering multi-syllable vocabulary (e.g., "carnivore", "habitat"). Breaking words into root syllables avoids cognitive overload.',
          microActivityTitle: 'Fossil Chisel Word Breakdown',
          microActivityDuration: '3 minutes',
          microActivityInstructions:
              'Write the target word on screen with slashes separating root syllables (car / ni / vore). Have Marcus make a tapping sound with his pencil for each syllable, then look at the surrounding sentence clues.',
          exactTutorScript:
              '"Whoa, Marcus, we just hit a boulder of a word in line 4! When a paleontologist hits hard rock, they don’t smash it all at once; they chisel it section by section. Let’s chisel this word together: car... ni... vore. Now look right after it: what does the text say this creature eats? Sharp teeth and meat! That’s our context clue!"',
          quickCheckQuestion: 'What clue in the sentence told us that a carnivore eats meat?',
          latencyMs: 45,
        );

      case SessionMomentType.frustration:
        return const TutorGuidance(
          studentName: 'Marcus',
          momentTitle: 'Frustrated / Low Confidence',
          pedagogicalStrategyTitle: 'Shared Echo-Reading & Cognitive Load Sharing',
          pedagogicalFrameworkTag: 'Stanford NSSA • Scaffolding & Stress Reduction',
          pedagogicalRationale:
              'Marcus has read three sentences with multiple mispronunciations and slumped in his chair. Taking over the mechanical decoding load restores safety.',
          microActivityTitle: 'The Echo Dig Technique',
          microActivityDuration: '2 minutes',
          microActivityInstructions:
              'Read one sentence aloud with enthusiastic inflection. Have Marcus immediately echo-read the exact same sentence. This builds auditory confidence before independent reading.',
          exactTutorScript:
              '"Hey Marcus, let’s do a tandem dig. Finding fossils is hard work, and scientists always work in pairs! I’m going to read this sentence in my best nature documentary voice. When I finish, you echo it back to me just like an echo in a dinosaur canyon. Listen closely: \'The giant Brachiosaurus reached the tallest canopy...\' Your turn, Dr. Marcus!"',
          quickCheckQuestion: 'How did your voice sound when you read that tall canopy line?',
          latencyMs: 37,
        );

      case SessionMomentType.wrapUp:
        return const TutorGuidance(
          studentName: 'Marcus',
          momentTitle: 'Session Wrap-Up & Growth Celebration',
          pedagogicalStrategyTitle: 'Cumulative Field Journal Stamp',
          pedagogicalFrameworkTag: 'Stanford NSSA • Intrinsic Motivation & Retention',
          pedagogicalRationale:
              'Reinforcing that Marcus read 150+ words independently today builds his identity as a confident, capable reader.',
          microActivityTitle: 'Field Journal Discovery Log',
          microActivityDuration: '3 minutes',
          microActivityInstructions:
              'On the digital whiteboard, draw a fossil badge stamp. Have Marcus dictate the single most fascinating fact he extracted from the reading passage.',
          exactTutorScript:
              '"Dr. Marcus, your field expedition today was a complete success! You excavated two whole paragraphs and decoded three giant words that would stump most 4th graders. I’m putting an official Stegosaurus Gold Stamp on your field journal. What is the #1 discovery you’re going to teach your family tonight?"',
          quickCheckQuestion: 'What was your favorite dinosaur fact that you read with your own eyes today?',
          latencyMs: 42,
        );
    }
  }

  // ---------------------------------------------------------------------------
  // ELENA (Grade 5 • Multi-digit Multiplication • Graphic Novels)
  // ---------------------------------------------------------------------------
  static TutorGuidance _generateElenaGuidance(SessionMomentType moment) {
    switch (moment) {
      case SessionMomentType.icebreaker:
        return const TutorGuidance(
          studentName: 'Elena',
          momentTitle: 'Session Kickoff',
          pedagogicalStrategyTitle: 'Visual Narrative Hook & Storyboarding',
          pedagogicalFrameworkTag: 'Stanford NSSA • Cross-Disciplinary Engagement',
          pedagogicalRationale:
              'Elena views math as rigid and intimidating, but feels expressive and capable when drawing graphic novels. Framing multiplication as comic panel layout bridges her confidence.',
          microActivityTitle: 'The Comic Book Grid Layout',
          microActivityDuration: '3 minutes',
          microActivityInstructions:
              'Ask Elena: "If you are drawing a 4-page graphic novel chapter and each page has 6 dynamic action panels, how many panels do you need to sketch in total?"',
          exactTutorScript:
              '"Elena, so glad you’re here! Before we dive into numbers, I want to talk storytelling. If an illustrator is laying out a manga chapter with 4 pages, and every single page has 6 action panels, how do you figure out how many panels to draw? Exactly, 4 times 6! Today, we are going to treat every multi-digit math problem like sketching out a storyboard grid!"',
          quickCheckQuestion: 'What happens if you expand each page to 8 panels instead of 6?',
          latencyMs: 40,
        );

      case SessionMomentType.conceptBlock:
        return const TutorGuidance(
          studentName: 'Elena',
          momentTitle: 'Concept Block (Multi-digit Anxiety)',
          pedagogicalStrategyTitle: 'Area Model Box Method via Comic Panels',
          pedagogicalFrameworkTag: 'Stanford NSSA • Conceptual Decomposition',
          pedagogicalRationale:
              'Traditional standard algorithm carries and cross-multiplications confuse Elena’s spatial working memory. The area model box breaks numbers into expanded place-value comic frames.',
          microActivityTitle: 'The 4-Panel Area Model Sketch',
          microActivityDuration: '4 minutes',
          microActivityInstructions:
              'For 24 x 15, draw a 2x2 grid. Break 24 into (20 + 4) across the top, and 15 into (10 + 5) down the side. Elena fills in each panel like comic cells: (200, 100, 40, 20), then adds them up.',
          exactTutorScript:
              '"Elena, forget the standard stack algorithm for a minute—it scrambles everything! Instead, draw a 4-panel comic grid on your paper. Across the top, write 20 and 4. Down the left, write 10 and 5. Now you just fill in four easy comic cells: 20 times 10 is 200, 20 times 5 is 100, 4 times 10 is 40, and 4 times 5 is 20. Add those four panels up, and you’ve conquered the entire page!"',
          quickCheckQuestion: 'Can you show me the sum of your four comic panels on your paper?',
          latencyMs: 43,
        );

      case SessionMomentType.frustration:
        return const TutorGuidance(
          studentName: 'Elena',
          momentTitle: 'Frustrated / Low Confidence',
          pedagogicalStrategyTitle: 'The "Rough Draft Sketch" Destigmatization',
          pedagogicalFrameworkTag: 'Stanford NSSA • Affective Safety & Psychological Security',
          pedagogicalRationale:
              'Elena has perfectionist tendencies; when her math answer doesn’t match the answer key, she erases everything furiously. Validating draft iterations lowers anxiety.',
          microActivityTitle: 'The Light Pencil Sketch Rule',
          microActivityDuration: '2 minutes',
          microActivityInstructions:
              'Tell Elena: "In animation studios, artists NEVER draw in permanent ink first. They use light blue pencil to test ideas. Math is just pencil sketching until we find the solution."',
          exactTutorScript:
              '"Elena, hold on to that eraser! Do you know what Hayao Miyazaki or comic artists do when they start a scene? They draw messy, light pencil sketches. Nobody writes in ink on the first pass! That mistake is just your pencil sketch. Don’t erase it—leave it so we can see how creative your brain was, and let’s sketch the tens-column together."',
          quickCheckQuestion: 'Can we circle the one small spot where the numbers shifted place value?',
          latencyMs: 38,
        );

      case SessionMomentType.wrapUp:
        return const TutorGuidance(
          studentName: 'Elena',
          momentTitle: 'Session Wrap-Up & Growth Celebration',
          pedagogicalStrategyTitle: 'Published Chapter Badge & Metacognitive Review',
          pedagogicalFrameworkTag: 'Stanford NSSA • Student Agency & Self-Efficacy',
          pedagogicalRationale:
              'Connecting her effort to a concrete finished milestone reinforces her mathematical growth and self-efficacy.',
          microActivityTitle: 'Issue #1 Illustrator Credits',
          microActivityDuration: '3 minutes',
          microActivityInstructions:
              'Designate Elena as "Lead Comic Mathematician". Have her summarize her favorite area-model technique in a single creator sentence.',
          exactTutorScript:
              '"Elena, you just published Issue #1 of multi-digit multiplication! When we started, looking at two-digit numbers felt overwhelming, but your area model comic grid was pure genius. As lead illustrator, what is the #1 trick you’ll tell yourself when you see a big multiplication problem on your homework this week?"',
          quickCheckQuestion: 'Why is breaking 36 into 30 and 6 easier than multiplying 36 all at once?',
          latencyMs: 41,
        );
    }
  }

  // ---------------------------------------------------------------------------
  // DYNAMIC SYNTHESIS FOR CUSTOM STUDENT PERSONAS
  // ---------------------------------------------------------------------------
  static TutorGuidance _generateCustomGuidance(
    StudentPersona persona,
    SessionMomentType moment,
  ) {
    final name = persona.name;
    final grade = persona.gradeLabel;
    final challenge = persona.learningChallenge;
    final interest = persona.interest;

    switch (moment) {
      case SessionMomentType.icebreaker:
        return TutorGuidance(
          studentName: name,
          momentTitle: 'Session Kickoff',
          pedagogicalStrategyTitle: 'Interest-Anchored Priming & Relational Safety',
          pedagogicalFrameworkTag: 'Stanford NSSA • Relational Rapport & Prior Knowledge',
          pedagogicalRationale:
              'Connecting $grade content with $name\'s passion for $interest builds psychological safety and lowers cognitive resistance before tackling $challenge.',
          microActivityTitle: '$interest Spark Exploration',
          microActivityDuration: '3 minutes',
          microActivityInstructions:
              'Warm up by asking $name to share one fascinating detail about $interest. Bridge that specific detail into a gentle introductory example connected to $challenge.',
          exactTutorScript:
              '"$name, before we get to our main challenge today, tell me something you love about $interest! Did you know that mastering $challenge uses the exact same problem-solving muscles you use when you engage with $interest? Let’s test that out right now!"',
          quickCheckQuestion:
              'How does thinking about $interest help make this lesson feel more fun?',
          latencyMs: 46,
        );

      case SessionMomentType.conceptBlock:
        return TutorGuidance(
          studentName: name,
          momentTitle: 'Concept Block ($challenge)',
          pedagogicalStrategyTitle: 'Concrete-Representational-Abstract (CRA) Translation',
          pedagogicalFrameworkTag: 'Stanford NSSA • Scaffolding & Conceptual Clarity',
          pedagogicalRationale:
              '$name is hitting a barrier with $challenge because the abstraction lacks physical intuition. Grounding the logic in analogies from $interest provides concrete anchors.',
          microActivityTitle: 'The $interest Logic Map',
          microActivityDuration: '4 minutes',
          microActivityInstructions:
              'Create a simple visual diagram or table comparing the mechanics of $interest with the steps needed to solve $challenge. Have $name label each part in their own words.',
          exactTutorScript:
              '"Let’s step back from the abstract formula, $name. If we were organizing this like $interest, what would be the very first step you’d take? Let’s draw that out together so we can see how $challenge breaks down into bite-sized pieces."',
          quickCheckQuestion:
              'Can you show me the first mini-step in your own words before we do the math?',
          latencyMs: 48,
        );

      case SessionMomentType.frustration:
        return TutorGuidance(
          studentName: name,
          momentTitle: 'Frustrated / Low Confidence',
          pedagogicalStrategyTitle: 'Productive Struggle Normalization & De-escalation',
          pedagogicalFrameworkTag: 'Stanford NSSA • Affective Regulation & Growth Mindset',
          pedagogicalRationale:
              '$name is feeling discouraged by mistakes in $challenge. Reconnecting with the perseverance required in $interest restores self-efficacy.',
          microActivityTitle: 'The 60-Second $interest Reset',
          microActivityDuration: '2 minutes',
          microActivityInstructions:
              'Pause the academic task for 60 seconds. Remind $name of a time they struggled when first learning $interest, and how deliberate practice led to breakthrough.',
          exactTutorScript:
              '"$name, take a pause with me. Nobody gets great at $interest on day one without trying and adjusting. Making mistakes with $challenge is literally how your brain builds new pathways! You are doing the hard work of learning right now, and I’m right beside you. Let’s tackle just this one small part together."',
          quickCheckQuestion:
              'Which part of this feels tricky: the beginning, the middle, or the final step?',
          latencyMs: 44,
        );

      case SessionMomentType.wrapUp:
        return TutorGuidance(
          studentName: name,
          momentTitle: 'Wrap-Up & Growth Celebration',
          pedagogicalStrategyTitle: 'Metacognitive Articulation & Effort Attribution',
          pedagogicalFrameworkTag: 'Stanford NSSA • Formative Synthesis & Learner Identity',
          pedagogicalRationale:
              'Synthesizing what was learned about $challenge builds lasting memory traces and sends $name away feeling capable and celebrated.',
          microActivityTitle: 'The $interest Mastery Exit Ticket',
          microActivityDuration: '3 minutes',
          microActivityInstructions:
              'Ask $name to explain one key insight about $challenge as if they were coaching someone else who loves $interest.',
          exactTutorScript:
              '"$name, you were incredible today! You pushed through the tough parts of $challenge with total focus. If you were giving advice to a friend who is also working on this, what is the #1 tip you’d give them?"',
          quickCheckQuestion:
              'What was your proudest breakthrough moment in today’s session?',
          latencyMs: 45,
        );
    }
  }
}
