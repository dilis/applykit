# Job Application Workspace

A [Claude Code](https://claude.com/claude-code) workspace for job hunting. You keep one applicant profile, paste in a job post, and Claude produces a tailored CV (PDF), a cover letter, a Markdown rewrite of the job post, and private fit notes. It writes everything from facts in your profile and does not invent experience.

## What you get per application

Each application lives in its own directory, `applications/<company>--<role>--<uuid>/`:

| File | Purpose |
| --- | --- |
| `job-post.md` | The job post rewritten in Markdown |
| `<Full Name>.pdf` | CV tailored to the role, in the standard layout |
| `cover-letter.txt` | Short plain-text cover letter |
| `application-notes.md` | Private notes: fit verdict, gaps, interview pointers, ATS keyword coverage, next steps. Never submitted. |

## Requirements

- [Claude Code](https://claude.com/claude-code)
- Python 3
- Google Chrome at `/Applications/Google Chrome.app` (macOS). `layout/build_cv.py` renders the PDF with headless Chrome. Edit the `CHROME` path in that file for another OS or location.
- macOS with Swift, for the ATS text-extraction check (`.claude/skills/ats-cv/scripts/check_ats.sh` uses PDFKit)

## Initialize

1. Clone the repo and open it in Claude Code:

   ```sh
   git clone <repo-url> application
   cd application
   claude
   ```

2. Create your profile from the example:

   ```sh
   cp profile/applicant.example.yaml profile/applicant.yaml
   ```

   Replace the example content with your own: contact details, summary, skills, experience, education, trainings. This file is the only source Claude uses about you, so keep it complete and accurate. An experience entry has `company`, `location`, `role`, `start`, `end` (`YYYY` or `YYYY-MM`, quoted; `null` for current), `highlights`, and optionally `about`. A highlight is either a string or a `text` plus `details` list.

3. That's it. `profile/applicant.yaml` and `applications/` are gitignored, so your personal data stays local.

## Use

In Claude Code, paste a job post (or a link) and ask for an application, for example:

> Create an application for this job: `<paste job post>`

Claude will:

1. Create `applications/<company>--<role>--<uuid>/` with a fresh UUID.
2. Rewrite the job post as `job-post.md`.
3. Build the CV with the `tailor-cv`, `ats-cv` skills and the layout in `layout/`, then check the PDF's extracted text against the job's keywords.
4. Write the cover letter with the `cover-letter` skill.
5. Write `application-notes.md`.

Review everything before sending. The notes are candid on purpose, so read the gaps and interview pointers.

Ask for changes in plain language ("shorten the cover letter", "emphasize cloud experience in the CV") and Claude will update the files. Each application gets a new directory, and existing ones are never overwritten.

## Repository layout

```
CLAUDE.md                        Instructions Claude follows in this repo
profile/
  applicant.example.yaml         Profile format (fictional); copy to applicant.yaml
  applicant.yaml                 Your profile (gitignored)
applications/                    One directory per application (gitignored)
layout/
  README.md                      CV layout spec
  cv.css                         CV stylesheet
  build_cv.py                    Renders an HTML body fragment to PDF via headless Chrome
.claude/skills/
  tailor-cv/                     Select, trim, and order profile content for a role
  cover-letter/                  Voice, structure, and format for the cover letter
  ats-cv/                        Keyword mapping and ATS verification
```

## Building a CV by hand

Claude does this for you, but the build step is a plain script:

```sh
python3 layout/build_cv.py <body-fragment.html> "applications/<application dir>/<Full Name>.pdf"
```

The fragment's structure is documented in `layout/README.md`.

## Privacy

Your profile and applications contain personal data. They are gitignored; do not commit them or put real personal details in tracked files. Use placeholders such as `Jane Doe` in docs and examples.
