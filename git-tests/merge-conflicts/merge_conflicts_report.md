# Merge Conflicts & Conflict Resolution

This task demonstrates my understanding of **merge conflicts in Git**, why they occur, and how to resolve them using
a real workflow. I intentionally created a conflict, resolved it using **VS Code’s merge editor**, and verified the
final result before pushing to GitHub.

---

## What Is a Merge Conflict

A merge conflict happens when Git cannot automatically combine changes from two branches.  
This usually occurs when:

- The same file is edited on different branches
- The same lines are changed in different ways
- Git cannot decide which version should win

Git pauses the merge and asks the developer to manually resolve the conflict.

---

## How I Created the Merge Conflict

I created a controlled conflict using a test file.

### Step 1: Initial File on Main

I created a file called `conflict.txt` with three lines and committed it on the `main` branch.

### Step 2: Edit on a Feature Branch

- Created a new branch called `conflict-branch`
- Edited **Line 2** of the file
- Committed the change on the branch

### Step 3: Conflicting Edit on Main

- Switched back to `main`
- Edited **the same line** in a different way
- Committed the change

### Step 4: Merge Attempt

When I merged `conflict-branch` into `main`, Git reported a merge conflict because the same line was changed
differently on both branches.

---

## Evidence: Merge Conflict Triggered

**Screenshot 1**

- Terminal output showing `CONFLICT (content)` after running `git merge conflict-branch`

<img width="735" height="477" alt="Image" 
src="https://github.com/user-attachments/assets/5aacdd20-abd8-43f0-b5e9-df6fd66ab9ff" />

---

## How I Resolved the Conflict

I resolved the conflict using **VS Code**, acting as a Git desktop client.

### Resolution Process

- Opened the repository in VS Code
- Opened the conflicted file from Source Control
- VS Code displayed conflict markers and resolution options
- I chose the **change from `conflict-branch`**
- Saved the file after resolving

This removed all conflict markers and left a clean final version.

---

## Evidence: Conflict Resolution in VS Code

**Screenshot 2**

- VS Code merge editor showing conflict markers and selected resolution

<img width="1268" height="873" alt="Image" 
src="https://github.com/user-attachments/assets/162675db-cd2c-43b5-b3fb-8d5f17917588" />

---

## Completing the Merge

After resolving the conflict:

- I staged the resolved file
- Committed the merge resolution
- Pushed the changes to GitHub

The merge commit was successfully created on `main`.

---

## Evidence: Clean Status and Final History

**Screenshot 3**

- Output of:
  - `git status`
  - `git log --oneline --decorate -5`

<img width="701" height="282" alt="Image" 
src="https://github.com/user-attachments/assets/6a0f03cd-6ddb-4424-a2eb-87b66ad51068" />

---

- GitHub commit history showing the merge commit

<img width="658" height="226" alt="Image" 
src="https://github.com/user-attachments/assets/5b0ca845-bd58-4fef-b335-f601064ea8a3" />

---

## Final File Content After Resolution

The final resolved file contains the branch’s version of the edited line:

```
Line 1: Focus Bear Git conflict practice
Line 2: Edited on conflict-branch
Line 3: End
```

This confirms the conflict was resolved correctly and intentionally.

---

## What Caused the Conflict

The conflict occurred because:

- The same file
- The same line
- Was edited differently on two branches

Git could not automatically decide which version was correct.

---

## What I Learned

- Merge conflicts are normal in collaborative development
- Git protects code by stopping unsafe merges
- Visual tools like VS Code make conflict resolution clearer
- Understanding branch history helps avoid mistakes
- Clear communication and small commits reduce conflicts

---

## Final Status

- Merge conflict created intentionally
- Conflict resolved using VS Code
- Changes committed and pushed
- Repository is clean and up to date

This task is complete and ready to be closed.
