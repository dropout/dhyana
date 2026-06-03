---
name: Create Screen With Route
description: "Create a new screen widget and wire a route for it in a Flutter app. Use when: adding a new screen in lib/widget/screen and registering a matching route class."
argument-hint: "e.g. SettingsScreen in apps/app"
agent: agent
---

Create a new screen and route in the selected Flutter app project.

Inputs:
- Preferred input: screen class name (for example: SettingsScreen).
- If screen name is not provided, ask for it before editing files.
- Optionally accept a target app root (for example: apps/app). If omitted, infer from active file context.

Requirements:
1. Screen widget
- Create the screen widget file under <app-root>/lib/widget/screen/.
- If a file with the same name already exists, stop and notify the user before making any changes.
- Use a Scaffold with a centered Text widget that displays the screen name.
- Example body content should render "SettingsScreen" for SettingsScreen.

2. Route
- Create a typed route class named <BaseName>Route for <BaseName>Screen in the `lib/widget/app_routes.dart` file.
- Use the build_runner to generate route code if applicable.
- Example: SettingsRoute for SettingsScreen.
- Path format: "/<base-name-lower-kebab>".
- For SettingsScreen, use path "/settings".
- For multi-word names, always use lower-kebab (for example: UserSettingsScreen -> "/user-settings").
- Route build method must return the created screen widget.

3. Wiring
- Update route registration in the app's router files so the new route is active.
- If the app uses generated typed go_router routes, update the source route file only (not generated files).
- If a screen barrel file exists (for example lib/widget/screen/all.dart), export the new screen file.

Execution rules:
- Follow existing import ordering and formatting style in the target app.
- Avoid touching unrelated routes or screens.
- If multiple app roots are possible and target is unclear, ask once before editing.

Report back with:
- New files created
- Existing files updated
- Exact route class name and path