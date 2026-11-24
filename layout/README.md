# CV layout

The standard CV layout, so every generated CV looks the same.
Always build CVs with `cv.css` + `build_cv.py` rather than a different layout.

    python3 layout/build_cv.py <body-fragment.html> applications/<application dir>/<full-name>.pdf

Write the body fragment (not committed to the application dir) in the session scratchpad, tailored from `profile/applicant.yaml`.

## Page
- A4 (595.2 x 841.8 pt), margins ~54pt top/bottom, 53.5pt left/right (content width ~487.5pt).
- Font: Helvetica Neue everywhere (regular / bold / italic). Pure black text, no color, no icons.
- Kerning and ligatures are disabled in the CSS on purpose: kerning makes extracted PDF text split words ("T ypeScript"), which breaks ATS keyword matching.
- Body 11pt on 12pt line height. Section headings 8pt bold uppercase.

## Structure (fragment)
```html
<header>
  <h1>Full Name</h1>              <!-- 18pt, regular, centered -->
  <p class="contact">address · <a href="mailto:…">email</a> · phone · <a href="…">linkedin url</a></p>  <!-- 10pt, centered, " · " separators, email + link underlined, wraps naturally -->
</header>
<section><h2>Professional Profile</h2><p>…</p><p>…</p></section>   <!-- each section starts with a full-width 0.75pt black rule -->
<section><h2>Skills</h2><ul><li><b>Languages:</b> Typescript, Javascript, Python, …</li></ul></section>   <!-- one bullet per category; bold label, then comma-separated items -->
<section class="experience"><h2>Professional Experience</h2>
  <div class="job">
    <div class="role-line"><i>Company</i> • Location • <b>Role</b></div>   <!-- 12pt; Remote if remote role -->
    <div class="period">June 2026 - Present</div>                           <!-- 12pt, line below -->
    <ul><li>… <b>TechKeyword</b> …<ul><li>nested bullet</li></ul></li></ul>
  </div>
</section>
<section class="education"><h2>Education and Trainings</h2>
  <div class="edu"><b>Institution</b> <span class="loc">City - Mon YYYY</span><br>Title</div>
</section>
```
- Section order: Professional Profile, Skills, Professional Experience (newest first), Education and Trainings (trainings first, then degree).
- Role row/period: per the CV layout skill, the role row is italic company, location, bold role, joined by " • ", with the period on the line below. Every experience entry in the profile has a location (Remote when it has no physical one).
- Bullets: "•" at the left margin, text indented 9pt, nested bullets indented a further 9pt. No spacing between bullets.
- Technology names inside bullets are bold (e.g. **Python**, **Postgres**, **BuildKite**); dates written `June 2024 - February 2026`, `2004 - March 2016`.
- Education/training entry: bold institution, then italic `City - Mon YYYY` on the same line, title on the next line.
- Skills are bulleted by category (Languages, Frameworks and Libraries, Databases, DevOps and Cloud, Other), ordered by relevance to the job. Items are plain text, not bold. Bullets use the same style as experience bullets.
- CVs flow over 3-4 pages; avoid orphaned role rows (CSS handles this).
