# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

This directory centralizes the owner's job-hunting effort. It is not a conventional software project: there is no build, lint, or test tooling yet. Supporting code may be added later; when it is, document its commands here.

## Layout

`profile/applicant.yaml` and everything under `applications/` are personal and gitignored: never commit them or copy real personal details into tracked files (use fictional placeholders like `Jane Doe`, `Acme Labs` in docs and examples). `profile/applicant.example.yaml` documents the profile format.

- `profile/applicant.yaml` is the owner's profile and the source of truth about their background: contact details, summary, skills, work experience, education, and trainings. Use it when tailoring CVs and cover letters. Do not invent experience, skills, or dates that are not in it.
  - Experience entries have `company`, `location`, `role`, `start`, `end` (`YYYY` or `YYYY-MM`, quoted strings), `highlights`, and optionally `about` (what kind of company it was, e.g. Acme Labs is an R&D software company). A highlight is either a string or a `text` plus `details` list.
- Each application will get its own directory under `applications/`, named `<company name>--<role>--<uuid>`.
  - Generate the `<uuid>` fresh for each application (e.g. `uuidgen | tr 'A-Z' 'a-z'`).
  - Use a filesystem-safe form of the company and role (no slashes; keep the `--` separators unambiguous).
- Each application directory contains the artifacts generated for that application:
  - the job post, rewritten in Markdown (not a raw copy of the original);
  - the CV, as a PDF named `<full-name>.pdf` (`name.short` from the profile, e.g. `Jane Doe.pdf`), not `cv.pdf`;
  - the cover letter, as a plain text file.
  - the application notes (`application-notes.md`), private working notes for the owner and never part of the submission: an overall fit verdict, fit against the job's must-haves and nice-to-haves with evidence from the profile, why the owner may not be a fit, gaps and how to close them, interview pointers (stories, likely questions, questions to ask), practical details from the post (setup, benefits), ATS keyword coverage, and next steps. Be candid and use only facts from the profile and the job post; do not soften gaps.
- `layout/` holds the standard CV layout (`layout/README.md` is the spec, `layout/cv.css` the stylesheet, `layout/build_cv.py` renders a body fragment to PDF via headless Chrome). Always build CVs with it so they look the same. Write the tailored HTML fragment in the scratchpad, not in the application directory.
- `.claude/skills/tailor-cv/` is a project skill to follow whenever generating a CV from the profile: the CV is tailor-fit to the job role (select, trim, order, and re-emphasize profile content), not a copy of the whole profile.
- `.claude/skills/cover-letter/` is a project skill to follow whenever writing a cover letter: casual, confident, polite and courteous voice, a short tailored structure, honest about gaps, plain-text format.
- `.claude/skills/ats-cv/` is a project skill to follow whenever generating a CV or cover letter, so the content ranks well in ATS (keyword mapping from the job post, truthful tailoring, and a PDF text-extraction check).
- Supporting code, if any, is written by the owner and kept separate from the application directories.

## Working conventions

- One application per directory. Never reuse or overwrite another application's directory; create a new one with a new UUID.
- Tailor each CV and cover letter to its job post, but only from facts in `profile/applicant.yaml`.
- Create `application-notes.md` for every application, alongside the CV and cover letter.
