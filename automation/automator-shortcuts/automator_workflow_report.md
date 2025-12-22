# 5.8 – Automator / Shortcuts Workflow

This task is complete. I created a macOS **Automator Quick Action** and exported the workflow file
as proof.

---

## Deliverable

- **Exported file**: `Automator_Demo_QuickAction.workflow`
- **Type**: Automator **Quick Action**
- **Purpose**: Shows a notification with today’s date to confirm the workflow ran successfully.

---

## Workflow Setup (Automator)

### Workflow receives

- **Workflow receives**: `no input`
- **In**: `any application`

### Actions used (final)

1. **Get Value of Variable**
   - Variable: `Today's date`

2. **Display Notification**
   - Title: `Automator Demo`
   - Message: `Automator workflow ran successfully on {Today's date}`

Note: I initially added an extra Text variable, but removed it because it was unused. The date
variable is directly embedded in the notification message and works correctly.

---

## How I Tested It

- I ran the Quick Action from Automator.
- A macOS notification appeared confirming the workflow executed successfully and showed today’s
  date.

---

## Screenshot Evidence

### Screenshot 1 — Automator workflow configuration

<img width="1263" height="874" alt="Image" 
src="https://github.com/user-attachments/assets/f39910bf-6e90-4671-9a88-4156a581bd9f" />

### Screenshot 2 — Notification result

<img width="384" height="97" alt="Image" 
src="https://github.com/user-attachments/assets/eb748992-03d1-492f-9c68-964934d44037" />

---

## Final Status

- Workflow created
- Exported `.workflow` file saved
- Notification confirmed successful run

This issue is complete and ready to be closed.
