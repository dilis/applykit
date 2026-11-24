---
name: tailor-cv
description: Use whenever generating a CV from profile/applicant.yaml for a specific job post. The CV is a summary of the profile tailored to the role: condense, merge, reword, and order profile facts in the job's terms instead of reproducing or merely subsetting the profile. Use together with ats-cv.
---

# Tailor the CV to the role

A generated CV is not a copy of the profile, and not just a subset of it. It is a **summary of the profile, written for one specific job**: the profile's facts condensed, merged, reworded, and ordered so they make the strongest case for that role. The profile stays the only source of facts.

## What a summary may and may not change
- May: merge related bullets into one, shorten, drop detail that does not serve this job, rephrase in the job post's vocabulary (when the profile supports the same meaning), reorder, and change what is emphasized.
- May not: add or imply any skill, tool, title, date, employer, scale, metric, outcome, or responsibility the profile does not state; upgrade a verb or scope (e.g. "contributed to" becomes "led"); drop a technology name that is still relevant. When merging bullets, every technology and claim in the result must be traceable to the bullets merged.

## Steps
1. **Read the job post** (`job-post.md` in the application directory) and write down, in the scratchpad: the role's seniority/type (IC, lead, architect, manager), the 5-8 must-haves, the main responsibilities, and the domain.
2. **Score every profile item** (each skill, role, and bullet) as *core* (directly evidences a must-have or responsibility), *supporting* (relevant context such as leadership, delivery, infrastructure), or *irrelevant* for this job.
3. **Condense** (select, then summarize):
   - Keep every employment entry with its title, company, location, and dates, so there are no unexplained gaps. Older or off-topic roles shrink to 1-3 bullets.
   - Write *core* material in full, condense *supporting* material into short merged bullets, and drop *irrelevant* material. Reword each kept bullet toward the job (what was built, with what, for what result stated in the profile). Target at most 3 pages.
   - **Breadth tail**: do not lose the breadth of the owner's experience. Distinct *supporting* or *irrelevant* facts that the condensed bullets dropped (other stacks, platforms, domains, duties, tooling) go back at the **end of the same role** as short bullets in the profile's original wording, after the job-relevant bullets. Skip only true duplicates of a bullet already shown. This keeps the top of each role tailored while the whole experience stays visible.
   - Skills: list all the profile's skills, grouped by category, with the job's matched terms first in each category and the most relevant categories first. Add job-relevant groupings (e.g. leadership practices) only from profile facts.
4. **Order**: roles stay reverse-chronological. Within a role, put the most job-relevant bullet first; within a bullet, name the job-relevant technology first. In Skills, order categories by relevance to the role.
5. **Rewrite** the Professional Profile as a short summary for this role: keep the owner's voice and claims, but reorder, condense, and rephrase so the opening sentences speak to this role's seniority, domain, and top must-haves, using only facts in the profile. Do not add unsupported claims. Use a role's `about` note when it backs a must-have: e.g. when the job values learning quickly, adaptability, innovation, or ambiguity, say the owner's years at Acme Labs, an R&D software company, shaped that (profile summary only, one short clause; not in the role row).
6. **Match seniority**: for a lead/architect role, surface leadership, mentoring, code review, roadmap and stack decisions, while keeping hands-on contribution visible; for an IC role, favor hands-on delivery bullets.
7. **Be honest about gaps**: if the job asks for something the profile lacks, do not imply it. Mention the gaps in the final summary, and in the cover letter when appropriate.
8. Then follow `ats-cv` for keyword wording and PDF verification, and build with `layout/build_cv.py` (standard layout, role-row format, bulleted skills).
