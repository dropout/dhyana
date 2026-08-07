# Feature Requirement Template

Use this template to define what a feature must achieve before writing implementation plans or code. It is intentionally requirements-first: describe the problem, users, outcomes, constraints, and acceptance criteria before deciding architecture or tasks.

This template is also designed to be handed to an AI agent for feature planning. A complete document should let an agent:
- understand the problem and desired user outcome
- separate requirements from implementation assumptions
- identify stories, edge cases, dependencies, and risks
- propose an architecture-aligned implementation plan for Dhyana

## How To Use This Template
- Write in plain language first; avoid jumping to technical solutions too early.
- Prefer measurable outcomes over vague goals.
- Use user stories when the feature has user-facing behavior.
- Use jobs-to-be-done language when the feature is workflow-oriented or internal.
- Mark unknowns explicitly instead of guessing.
- Keep "Requirements" and "Proposed Solution" separate.

---

## 1. Document Metadata
- **Feature name**:
- **Author**:
- **Date**:
- **Status**: Draft / In Review / Approved / Implemented
- **Related epic / initiative**:
- **Target release**:
- **Stakeholders**:
- **Related documents**:

## 2. Executive Summary
Briefly explain the feature in 3 to 6 sentences.

Prompting questions:
- What problem are we solving?
- Who benefits from this feature?
- What changes for the user after this ships?
- Why is this valuable now?

## 3. Problem Statement
Describe the current pain point or gap.

Include:
- current behavior
- why current behavior is insufficient
- evidence, observations, or assumptions
- the impact if nothing changes

Template:

> Today, `[user type]` cannot / struggles to `[goal]` because `[current limitation]`. This causes `[user impact]` and `[business or product impact]`.

## 4. Goal And Desired Outcomes
Define the intended outcomes, not the implementation.

- **Primary goal**:
- **Secondary goals**:
- **Success metrics**:
- **User impact**:
- **Business or product impact**:

Example success metrics:
- feature adoption rate
- completion rate of the target flow
- reduction in drop-off or confusion
- reduction in support or error cases

## 5. Users And Context
Describe who the feature is for and when they use it.

- **Primary user persona(s)**:
- **Secondary user persona(s)**:
- **User context**:
- **Trigger moments**:
- **Frequency of use**:
- **Accessibility or inclusion considerations**:

## 6. Scope
Be explicit about what is and is not part of this feature.

### In Scope
-

### Out Of Scope
-

### Future Considerations
-

## 7. User Stories
Use stories when user behavior matters. Keep them outcome-oriented.

Story template:

> As a `[user type]`, I want to `[action]`, so that `[outcome]`.

Recommended guidance:
- Write 1 primary story for the main value.
- Add supporting stories only when behavior or permissions differ.
- Split stories when acceptance criteria, dependencies, or edge cases differ materially.

### Primary Story
- As a `...`, I want to `...`, so that `...`.

### Supporting Stories
- As a `...`, I want to `...`, so that `...`.
- As a `...`, I want to `...`, so that `...`.

### Optional Jobs-To-Be-Done Framing
Use this if it clarifies the workflow better than stories.

> When `[situation]`, I want to `[motivation]`, so I can `[expected outcome]`.

## 8. Functional Requirements
List the behaviors the system must provide.

Write each requirement so it can be tested.

Template:
- **FR-1**: The system must `...`
- **FR-2**: The user must be able to `...`
- **FR-3**: The system must prevent `...`

Guidance:
- Prefer one behavior per requirement.
- State observable behavior, not implementation detail.
- Include validation rules where relevant.

## 9. Acceptance Criteria
Acceptance criteria should decide whether a story or requirement is done.

Recommended format:
- **AC-1**: Given `...`, when `...`, then `...`
- **AC-2**: Given `...`, when `...`, then `...`

Alternative checklist format:
- The feature displays `...`
- The feature blocks `...`
- The feature recovers from `...`

Guidance:
- Cover the happy path first.
- Add negative paths and empty states only where they matter.
- Include loading, error, retry, and permission behavior when relevant.

## 10. Non-Functional Requirements
Document the quality constraints that shape the solution.

- **Performance**:
- **Reliability**:
- **Security / privacy**:
- **Accessibility**:
- **Localization**:
- **Offline / sync behavior**:
- **Analytics / observability**:
- **Platform constraints**:

Examples:
- The feature must work without blocking the UI thread.
- User-facing text must be localizable.
- Failures must surface a recoverable UI state.
- Sensitive data must not be logged.

## 11. User Experience Expectations
Describe important UX rules without prescribing the entire UI design.

- **Entry points**:
- **Core flow**:
- **Empty states**:
- **Loading states**:
- **Error states**:
- **Success states**:
- **Navigation expectations**:
- **Haptics / audio / motion expectations**:

For Dhyana specifically, include meditation-specific concerns when relevant:
- calmness and cognitive load
- interruptions during timed flows
- audio behavior and recovery
- screen transitions during active sessions

## 12. Data And State Requirements
Describe the information the feature uses or produces.

- **Inputs**:
- **Outputs**:
- **Persisted data**:
- **Derived state**:
- **Ownership of source of truth**:
- **Migration needs**:
- **Retention or deletion rules**:

## 13. Dependencies And Constraints
- **Technical dependencies**:
- **Product dependencies**:
- **External services**:
- **Legal / policy constraints**:
- **Operational constraints**:
- **Assumptions**:

## 14. Risks And Edge Cases
Capture known failure modes before planning.

### Risks
-

### Edge Cases
- no network
- partial data
- duplicate actions
- interrupted flows
- permission denied
- unexpected app lifecycle events

### Open Questions
-

## 15. Agile Delivery Breakdown
This section helps convert the feature into implementation-ready work.

### Epic
- **Epic statement**:

### Story Breakdown
Use this table when splitting into deliverable stories.

| Story ID | Story Summary | User Value | Acceptance Focus | Dependencies | Suggested Size |
| --- | --- | --- | --- | --- | --- |
| ST-1 |  |  |  |  | S / M / L |
| ST-2 |  |  |  |  | S / M / L |

### Definition Of Ready
- The problem statement is clear.
- Scope is defined.
- Acceptance criteria are testable.
- Dependencies and assumptions are documented.
- Open questions are either resolved or explicitly tracked.

### Definition Of Done
- Requirements are implemented.
- Acceptance criteria are verified.
- Relevant tests are added or updated.
- User-facing strings are localized.
- Analytics, logging, and error handling are covered where required.
- Documentation is updated if behavior or setup changed.

## 16. AI Handoff Section
Complete this section if the document will be passed to an AI agent for planning or implementation support.

### Planning Objective
Describe exactly what you want the AI agent to produce.

Examples:
- create an implementation plan aligned with the app architecture
- propose story sequencing and technical milestones
- identify impacted layers, files, tests, and dependencies
- draft a feature design document from the approved requirements

### Required Output From The AI Agent
- implementation plan by architectural layer
- impacted modules, repositories, services, and widgets
- recommended story order
- test strategy
- risks, assumptions, and unresolved questions

### Repository Constraints The Agent Must Follow
- Architecture flow: `Widget -> Cubit/Bloc -> Repository -> Data Provider`
- Keep business logic out of widgets.
- Prefer Cubit for simple state flows.
- Keep Firebase details behind providers and repositories.
- Add localization for user-facing strings.
- Report cubit errors through Crashlytics where appropriate.

### Inputs For The Agent
- **Approved requirements summary**:
- **Relevant files or modules**:
- **Known technical constraints**:
- **Areas that must not change**:
- **Expected output format**:

### Questions The Agent Should Answer
- Which layers are affected?
- What contracts or interfaces should be introduced first?
- What are the minimum stories or milestones for safe delivery?
- What tests are required?
- What ambiguities in the requirements still block implementation?

## 17. Proposed Solution Sketch
Optional. Only complete this section after requirements are reviewed.

Keep this high level. This section exists to capture early direction without polluting the requirements above.

- **Preferred approach**:
- **Alternatives considered**:
- **Why this approach is preferred**:
- **Expected tradeoffs**:

## 18. Sample Filled Example
Use this example as a reference for tone and level of detail.

### Feature Name
Saved Meditation Presets

### Executive Summary
Users can save a meditation timer configuration as a reusable preset so they can start recurring sessions faster. This reduces repetitive setup for common meditation routines and makes the app feel more supportive for daily practice. The initial release supports creating, naming, editing, and launching presets from the timer flow.

### Problem Statement
Today, repeat meditators must manually reconfigure their timer settings for common session types. This adds friction before starting practice, especially for users who alternate between a small set of routines. The extra setup time increases the chance that a user abandons or delays the session.

### Primary Story
- As a repeat meditator, I want to save my timer configuration as a preset, so that I can start common sessions quickly.

### Supporting Stories
- As a repeat meditator, I want to edit a saved preset, so that it stays aligned with my practice.
- As a repeat meditator, I want to delete a preset, so that outdated presets do not clutter my list.

### Functional Requirements
- **FR-1**: The user must be able to save the current timer configuration as a named preset.
- **FR-2**: The system must validate that preset names are not empty.
- **FR-3**: The user must be able to launch a meditation session from a saved preset.
- **FR-4**: The user must be able to edit and delete existing presets.

### Acceptance Criteria
- **AC-1**: Given a configured timer, when the user saves it with a valid name, then the preset appears in the preset list.
- **AC-2**: Given an empty preset name, when the user tries to save, then the save action is blocked and a validation message is shown.
- **AC-3**: Given an existing preset, when the user selects it, then the timer settings are populated and the user can start the session.

### Non-Functional Requirements
- User-facing text must be localized.
- Preset retrieval must feel immediate for typical user data sizes.
- Errors saving presets must surface a recoverable state.

### AI Handoff Objective
Produce a Dhyana architecture-aligned implementation plan that identifies the required widget, cubit, repository, and storage changes for saved meditation presets, plus the tests needed for the happy path and error states.

---

## 19. Copy/Paste Starter

```md
# [Feature Name]

## 1. Document Metadata
- **Feature name**:
- **Author**:
- **Date**:
- **Status**:
- **Related epic / initiative**:
- **Target release**:
- **Stakeholders**:
- **Related documents**:

## 2. Executive Summary

## 3. Problem Statement

## 4. Goal And Desired Outcomes
- **Primary goal**:
- **Secondary goals**:
- **Success metrics**:
- **User impact**:
- **Business or product impact**:

## 5. Users And Context
- **Primary user persona(s)**:
- **Secondary user persona(s)**:
- **User context**:
- **Trigger moments**:
- **Frequency of use**:
- **Accessibility or inclusion considerations**:

## 6. Scope
### In Scope
-

### Out Of Scope
-

### Future Considerations
-

## 7. User Stories
### Primary Story
- As a `...`, I want to `...`, so that `...`.

### Supporting Stories
- As a `...`, I want to `...`, so that `...`.

## 8. Functional Requirements
- **FR-1**:

## 9. Acceptance Criteria
- **AC-1**: Given `...`, when `...`, then `...`

## 10. Non-Functional Requirements
- **Performance**:
- **Reliability**:
- **Security / privacy**:
- **Accessibility**:
- **Localization**:
- **Offline / sync behavior**:
- **Analytics / observability**:
- **Platform constraints**:

## 11. User Experience Expectations
- **Entry points**:
- **Core flow**:
- **Empty states**:
- **Loading states**:
- **Error states**:
- **Success states**:
- **Navigation expectations**:
- **Haptics / audio / motion expectations**:

## 12. Data And State Requirements
- **Inputs**:
- **Outputs**:
- **Persisted data**:
- **Derived state**:
- **Ownership of source of truth**:
- **Migration needs**:
- **Retention or deletion rules**:

## 13. Dependencies And Constraints
- **Technical dependencies**:
- **Product dependencies**:
- **External services**:
- **Legal / policy constraints**:
- **Operational constraints**:
- **Assumptions**:

## 14. Risks And Edge Cases
### Risks
-

### Edge Cases
-

### Open Questions
-

## 15. Agile Delivery Breakdown
### Epic
- **Epic statement**:

### Story Breakdown
| Story ID | Story Summary | User Value | Acceptance Focus | Dependencies | Suggested Size |
| --- | --- | --- | --- | --- | --- |
| ST-1 |  |  |  |  | S / M / L |

## 16. AI Handoff Section
### Planning Objective

### Required Output From The AI Agent
-

### Inputs For The Agent
- **Approved requirements summary**:
- **Relevant files or modules**:
- **Known technical constraints**:
- **Areas that must not change**:
- **Expected output format**:

### Questions The Agent Should Answer
-

## 17. Proposed Solution Sketch
- **Preferred approach**:
- **Alternatives considered**:
- **Why this approach is preferred**:
- **Expected tradeoffs**:
```
