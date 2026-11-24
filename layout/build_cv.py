#!/usr/bin/env python3
"""Render a CV body fragment (HTML) into a PDF using layout/cv.css and headless Chrome.

Usage: build_cv.py <body-fragment.html> <output.pdf>
The fragment follows the structure documented in layout/README.md.
"""
import re
import pathlib, subprocess, sys, tempfile

CHROME = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
here = pathlib.Path(__file__).resolve().parent
body = pathlib.Path(sys.argv[1]).read_text()
out = pathlib.Path(sys.argv[2]).resolve()
css = (here / "cv.css").read_text()
m = re.search(r"<h1[^>]*>(.*?)</h1>", body, re.S)
title = m.group(1).strip() if m else "CV"
html = f'<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"><title>{title}</title><style>{css}</style></head><body>{body}</body></html>'
with tempfile.TemporaryDirectory() as d:
    f = pathlib.Path(d) / "cv.html"
    f.write_text(html)
    subprocess.run([CHROME, "--headless=new", "--disable-gpu", "--no-pdf-header-footer",
                    f"--print-to-pdf={out}", f.as_uri()], check=True, capture_output=True)
print(out)
