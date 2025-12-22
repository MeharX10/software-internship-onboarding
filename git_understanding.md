# Git Concept: Staging vs Committing

---

## What is staging?

Staging is the step where I tell Git **which specific changes I want to include** in my next commit.  
The changes go into something called the _staging area_, but they are not saved to Git history yet.

---

## What is committing?

Committing is when I permanently save the staged changes into Git’s history with a message.  
Once committed, the changes get a commit hash and become part of the project timeline.

---

## Why does Git separate staging and committing?

Git separates these steps so I can:

- Review changes before saving them
- Commit only selected parts of a file
- Group related changes into one clean commit

This helps keep the commit history clean and meaningful.

---

## When would I stage without committing?

I would stage without committing when:

- I’m still working but want to prepare some changes
- I want to test something before committing
- I want to split changes into multiple commits
- I’m not ready to write a final commit message yet

Staging gives me control without locking anything into history.

---

## Terminal Screenshots (Evidence)

<img width="969" height="847" alt="Image" src="https://github.com/user-attachments/assets/4ce4c52e-b055-4676-b96b-dc3352cb1e08" />

---
