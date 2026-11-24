# Job application workspace

A Claude Code workspace for tailoring CVs and cover letters to job posts, from a single applicant profile.

- `profile/applicant.example.yaml`: the profile format. Copy it to `profile/applicant.yaml` (gitignored) and fill it in.
- `applications/`: one directory per application (gitignored). See `CLAUDE.md`.
- `layout/`: the standard CV layout and `build_cv.py` (HTML fragment to PDF via headless Chrome).
- `.claude/skills/`: `tailor-cv`, `cover-letter`, `ats-cv`.
