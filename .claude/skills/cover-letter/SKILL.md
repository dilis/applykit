---
name: cover-letter
description: Use whenever writing or rewriting a cover letter for a job application in this repo. Defines the voice (casual, confident, polite and courteous), structure, length, plain-text format, and honesty rules. Use together with tailor-cv and ats-cv.
---

# Cover letter

The letter is a short, human note that makes the case for one specific job. It complements the CV; it does not repeat it.

## Voice
- **Casual**: write the way a thoughtful person talks to a future colleague. Contractions are fine ("I've", "I'd"). Short, plain sentences. No corporate filler.
- **Confident**: state what was done and the result in plain, active words ("I built", "I led"). No hedging on things that are true ("I think I might be able to"), and no hype or superlatives about oneself ("passionate", "rockstar", "best", "expert", "world-class", "perfect fit"); let the work speak.
- **Polite and courteous**: respectful and warm toward the reader. Thank them for their time and consideration, acknowledge the role and company with genuine appreciation (something specific, not flattery), and phrase requests gently ("I'd welcome the chance to talk", "I'd appreciate the opportunity"). Never pushy, entitled, or demanding. Keep it professional even when the tone is casual.
- Avoid clichés and openers like "I am writing to apply for", "I am excited to", "I believe I would be a great asset", "dynamic", "synergy", "leverage", "results-driven". Avoid em dashes; use commas, periods, or parentheses.
- Sound like the owner, not a template: the owner's profile summary describes someone pragmatic, quality-focused, and a fast learner. Reflect that, without copying the profile's phrases.

## Facts
- Only facts from `profile/applicant.yaml`. Never invent experience, tools, numbers, outcomes, or dates; never upgrade scope ("contributed" is not "led").
- Do not claim a skill the job post asks for if the profile lacks it. Name the 1-2 biggest gaps honestly and politely in one sentence and say how they would be closed ("I haven't worked with X yet, but I've picked up similar things quickly, e.g. ..."), using only real examples from the profile.
- Use the company's and job post's real names and terms (from `job-post.md`), spelled exactly. Do not scrape or re-open the original post.

## Catching up on gaps
When the job asks for something the profile lacks, the message is: "I haven't done this yet, and I can get up to speed." Back it with the owner's background, which they have stated themselves: years in an R&D software company shaped them to be adaptable, to learn quickly, and to be comfortable with unknowns. Use it as the reason the gap is not a worry, in the owner's casual, confident voice, for example:
- "I haven't used X yet. My years at Acme Labs, an R&D software company, shaped me to learn new things fast and stay comfortable when the answer isn't known yet, so I'm confident I can get up to speed."
- Vary the wording each time; avoid repeating this sentence verbatim from letter to letter. Prefer verbs like "shaped", "taught", "made it second nature"; avoid "trained".
Rules:
- Pair it with one real example from the profile where they picked up something new (e.g. moving across embedded, web, mobile, and cloud work) when space allows.
- Say they can catch up, not that they already know it or are an expert. No overclaiming, no timelines or promises the profile cannot back.
- The R&D background is Acme Labs (<years from the profile>), an R&D software company (see `about` in the profile). It is fine to name it ("my years at Acme Labs, an R&D software company"); never invent details about that work beyond what the profile states.
- Keep it to 1-2 sentences, and keep it polite and confident rather than defensive or apologetic.

## Structure (aim for 250-350 words, never over one page)
1. **Opening (2-3 sentences)**: which role, and the single most relevant reason you fit (one concrete thing, not a summary of the whole career). Mention something specific about the company or role from the job post so it is clearly not generic.
2. **Evidence (1-2 short paragraphs, or 3-4 bullets)**: pick the 2-4 profile items that best match the job's top must-haves, tailored per `tailor-cv`. For each: what was built or owned, with which tools, and the outcome the profile states. Use the job post's wording for matching terms (this also helps ATS). Do not retell the CV.
3. **Leadership/fit (1-2 sentences, if the role has it)**: tie to what the job asks for (e.g. leading while still coding), grounded in a real example.
4. **Honest gap (1-2 sentences)**: the main thing not yet done, plus how it will be handled. Frame it as something the owner can pick up (see "Catching up on gaps"), not as a weakness.
5. **Close (1-2 sentences)**: thank the reader for their time and consideration, and courteously invite a conversation. No demands, no stiff boilerplate like "I look forward to hearing from you at your earliest convenience".

## Format (plain text file `cover-letter.txt` in the application directory)
```
<full name from the profile>
<email> | <phone> | <linkedin>

<Month D, YYYY>

Hiring Team
<Company>

Re: <Job title exactly as in the job post>

Dear Hiring Team,

<body>

Sincerely,
<full name from the profile>
```
- Use a named recipient instead of "Hiring Team" only if the job post names one.
- Plain text only: no markdown, tables, or special characters beyond ASCII punctuation; bullets as "- ". Paragraphs separated by one blank line; do not hard-wrap lines.
- Use today's date.

## Final check
Read it aloud in your head: does it sound like a person who is friendly, confident, and courteous? Then verify: every claim maps to the profile; no clichés or superlatives; the reader is thanked and addressed respectfully; one honest gap named; the job title and company are spelled exactly; the top 3-5 job keywords appear naturally; length is within 350 words (excluding header and sign-off); it adds something beyond the CV.
