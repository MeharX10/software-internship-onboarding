# Git Bisect Debugging Report

## Goal

I practiced `git bisect` to find which commit introduced a bug in my repo.

## What I built

I created a small Swift script (`git-tests/bisect/BisectDemo.swift`) that prints a total score.

- Good behaviour: prints `Total score: 15`
- Bad behaviour: either prints the wrong total, or fails to compile

## Commits involved

- Good commit: `afebe5c` (script works, correct output)
- Bad commit: `781f9cb` (script output becomes incorrect)

## Bisect commands I used

```bash
git bisect start
git bisect good afebe5c
git bisect bad 781f9cb
swift git-tests/bisect/BisectDemo.swift
git bisect good   # when output was correct
git bisect bad    # when output was wrong / compile error
git bisect reset
```

---

## What caused the bug

- The bug was introduced when the `totalScore` implementation became incorrect / broken (compile error).
- `git bisect` helped me pinpoint the exact commit where the behaviour first changed from good → bad.

---

## What does git bisect do?

- It finds the first commit that introduced a bug using binary search.
- It drastically reduces debugging time compared to manual commit inspection.

---

## What I learned

- `git bisect` is a fast way to find the first commit that introduced a bug.
- You must correctly mark commits as `good` or `bad` based on real test output.
- It is much faster than manually checking commit history when there are many commits.

---

## Comparison to manual review

| Method               | Speed | Accuracy      |
| -------------------- | ----- | ------------- |
| Manual commit review | Slow  | Error-prone   |
| `git bisect`         | Fast  | Very accurate |

---

## Screenshots (evidence)

- Screenshot 1:
  <img width="788" height="714" alt="Image" src="https://github.com/user-attachments/assets/ea59213b-fa0b-47dc-9a68-598e87f2d5c3" />

---

## When would I use it in real projects?

- When a bug appears after many commits.
- When I know a previously working commit.
- When debugging regressions in production code.

---

## Conclusion

This task helped me understand how professional developers debug regressions in large codebases. By simulating a real bug and tracing it with git bisect, I learned how powerful Git’s debugging
tools can be when used correctly.

The task requirements are fully satisfied and the issue is ready to be closed.
