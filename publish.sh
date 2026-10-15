#!/bin/sh
# Rebuild the CV and the website, then commit and push.
# Usage: ./publish.sh "commit message"
set -e
cd "$(dirname "$0")"

Rscript -e 'rmarkdown::render("CV/CV_Antoine_Castet.Rmd", output_dir = "PDF", quiet = TRUE)'
Rscript -e 'rmarkdown::render_site(quiet = TRUE)'

git add -A
git commit -m "${1:-Update website and CV}"
git push
