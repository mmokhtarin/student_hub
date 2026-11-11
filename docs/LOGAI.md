# AI Usage Log and Comparison Report

Course: TMA3084 Software Engineering Laboratory
Project: StudentHub Application (Lab Exercise 5.1)
Group: 01_T11
Group leader: Muhammad Mokhtarin Bin Dawari (105256)
Lab demo: MD. Aminul Islam Rakib

==================================================

1. Objective
Our group was tasked with refactoring the navigation state management of our StudentHub application. Specifically, we moved the selected navigation index (currentIndex) out of a local StatefulWidget into an external Provider state management class. This ensures state is decoupled from the UI, improves code maintainability and follows Material Design 3 guidelines.

2. Prompt Used for AI Tools
We provided the following prompt to both ChatGPT Codex and Claude:

"Refactor the navigation state of my Flutter application. Move the currentIndex state out of the local StatefulWidget into a dedicated ChangeNotifier class using the provider package. Ensure the state logic is cleanly separated from the UI widgets, adheres to Material 3 NavigationBar guidelines, avoids unnecessary widget rebuilds and passes flutter analyze without errors."

3. Comparison: ChatGPT Codex vs. Claude

Metric: Requirement Adherence
- ChatGPT Codex: Successfully created a ChangeNotifier and updated the navigation bar.
- Claude: Successfully created a ChangeNotifier and provided a modular screen structure.

Metric: Code Readability and Structure
- ChatGPT Codex: Bundled both the provider class and UI inside a single code block, requiring manual separation.
- Claude: Cleanly split the implementation into separate files (app_state_provider.dart and main_screen.dart) with clear comments.

Metric: Null Safety
- ChatGPT Codex: Followed Dart 3 null-safety conventions correctly.
- Claude: Followed Dart 3 null-safety conventions correctly.

Metric: Widget Rebuilding Efficiency
- ChatGPT Codex: Placed Provider.of at the top of the build method, causing the entire Scaffold to rebuild whenever the tab changed.
- Claude: Suggested more localized listening, rebuilding only the active view and navigation bar.

Metric: Flutter Analysis and Tests
- ChatGPT Codex: Produced one minor warning regarding constructor parameters.
- Claude: Passed flutter analyze with zero issues and ran cleanly with flutter test.

4. Log of Accepted and Rejected Suggestions

Suggestions from ChatGPT Codex:
- Accepted: The simple setter logic checking if the new index is different before calling notifyListeners().
- Rejected: Using older BottomNavigationBar properties that have been superseded by Material 3 NavigationBar.

Suggestions from Claude:
- Accepted: Modular folder structure separating providers and UI screens, plus clean integration with our navigation drawer.
- Rejected: A suggested fade animation between tabs that caused test timeouts during automated widget testing.

5. AI Comparison Summary and Verdict

Both AI assistants provided functional Flutter solutions, but their output quality differed:

ChatGPT Codex was fast and provided concise logic, but it tended to suggest older Flutter syntax and did not structure the code into separate files by default. It also required manual adjustment to prevent the entire screen from rebuilding unnecessarily on tab switches.

Claude generated code that followed modern Flutter best practices more closely, including Material 3 components and clean separation of concerns. While it occasionally added extra animations that we had to remove, its architectural structure was superior and required fewer manual fixes.

Final Decision: Our group adopted the Claude-assisted structure for our navigation refactoring because it aligned better with Flutter best practices and passed all static analysis and automated test checks. All code was reviewed and tested locally before merging.
