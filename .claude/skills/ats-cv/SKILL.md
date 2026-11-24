---
name: ats-cv
description: Use whenever generating or tailoring a CV for a job application in this repo, so the CV ranks high in applicant tracking systems (ATS). Covers keyword matching against the job post, ATS-safe structure, truthful tailoring, and a verification step on the rendered PDF.
---

# ATS-optimized CV

Apply this on top of the standard layout (`layout/README.md`, `layout/cv.css`, `layout/build_cv.py`) and the role-row rule from the CV layout skill. The layout is already ATS-safe (single column, real text, no tables/images/icons, standard fonts, `•` bullets); keep it that way.

## Hard rules
- Facts come only from `profile/applicant.yaml`. Never add a skill, tool, title, or date just because the job post asks for it. A missing keyword stays missing; it is better to rank lower than to misrepresent.
- No keyword stuffing, hidden/white text, or repeating a term only to inflate counts.

## Workflow
1. **Extract keywords from `job-post.md`.** List must-haves first, then nice-to-haves and responsibilities: technologies, protocols, tools, domain terms, seniority/years, soft-skill phrases. Record each term exactly as the post writes it, including acronym and spelled-out forms (e.g. "OAuth 2.0", "CI/CD", "REST APIs").
2. **Map to the profile.** Classify each term as:
   - *Direct* match: the profile states it. Use the post's exact wording/spelling and casing (e.g. "TypeScript", "PostgreSQL" vs "Postgres": pick the post's form when the profile means the same thing).
   - *Adjacent*: closely related evidence exists (e.g. "REST APIs" ← integrating data from 3rd party API providers). Only use wording the evidence actually supports.
   - *Absent*: do not add. Mention the gaps to the user in the final summary.
3. **Tailor the content** following the `tailor-cv` skill (select/trim/order for the role), then apply the keyword wording here (still using the standard layout):
   - **Professional Profile**: keep the owner's text, but order/phrase so the job's top 2-3 themes appear in the first two sentences, only where true.
   - **Skills**: bulleted by category; put the job's matched terms first in each category and drop clearly irrelevant ones. Include both acronym and long form once for important terms (e.g. "CI/CD (GitHub Actions, GitLab CI, BuildKite)").
   - **Experience**: keep every role and its dates; within a role, lead with the bullets most relevant to the post and trim the least relevant. Weave matched keywords into bullets in context (what was built, with what), and bold technology names as the layout specifies. Reuse the post's verbs/nouns when the profile supports them.
   - Use the job post's title for a profile role only if it is truthful; otherwise keep the profile's title verbatim.
4. **Keep structure parseable.** Standard section order and headings from the layout; dates in consistent `Month YYYY - Month YYYY` form (plain `YYYY` when the profile only has a year); contact details in the body (not a page header/footer); no text in images, columns, or tables.
5. **Build** with `layout/build_cv.py` into the application directory as `<full-name>.pdf` (the profile's `name.short`, e.g. `Jane Doe.pdf`; never `cv.pdf`).
6. **Verify** with `scripts/check_ats.sh <full-name>.pdf <keywords.txt>`, where `keywords.txt` has one job keyword per line (only terms the profile supports plus the absent ones, so gaps show up). It extracts the PDF's text the way an ATS parser would and reports which keywords are present/missing and how many times. Check that:
   - the text extracts in reading order with section headings and contact info intact;
   - every *Direct*/*Adjacent* keyword appears at least once, ideally in both Skills and an Experience bullet;
   - the "suspicious extraction" section is empty; split words (e.g. `T ypeScript`) or stray spaces mean keywords will not match. `layout/cv.css` disables kerning and ligatures for this reason, so do not re-enable them;
   - no term appears suspiciously often (more than ~4 times).
   Fix and rebuild until satisfied. Keep the keywords file in the scratchpad, not the application directory.
7. **Report** to the user: keywords matched, keywords the profile cannot support (gaps), and any judgment calls on wording.

## Cover letter
The same keyword mapping applies: use the post's exact terms for the strongest 3-5 matches, in plain sentences. Plain text only.
