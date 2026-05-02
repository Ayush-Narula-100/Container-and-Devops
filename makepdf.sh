#!/bin/bash

# ===== STUDENT DETAILS (EDIT THIS) =====
TITLE="DevOps Lab Report"
AUTHOR="Ayush Narula"
SAPID="500119444"

# ===== URLs (ADD/REMOVE AS NEEDED) =====
URLS=(
  "https://github.com/Ayush-Narula-100/Container-and-Devops/tree/main/Lab/Experiment%201/Readme.md"
  "https://github.com/Ayush-Narula-100/Container-and-Devops/tree/main/Lab/Experiment%202/Readme.md"
  "https://github.com/Ayush-Narula-100/Container-and-Devops/tree/main/Lab/Experiment%203/Readme.md"
  "https://github.com/Ayush-Narula-100/Container-and-Devops/tree/main/Lab/Experiment%204/Readme.md"
  "https://github.com/Ayush-Narula-100/Container-and-Devops/tree/main/Lab/Experiment%205/Readme.md"
  "https://github.com/Ayush-Narula-100/Container-and-Devops/tree/main/Lab/Experiment%206/Readme.md"
  "https://github.com/Ayush-Narula-100/Container-and-Devops/tree/main/Lab/Experiment%207/Readme.md"
  "https://github.com/Ayush-Narula-100/Container-and-Devops/tree/main/Lab/Experiment%208/Readme.md"
  "https://github.com/Ayush-Narula-100/Container-and-Devops/tree/main/Lab/Experiment%209/Readme.md"
  "https://github.com/Ayush-Narula-100/Container-and-Devops/tree/main/Lab/Experiment%2010/Readme.md"
  "https://github.com/Ayush-Narula-100/Container-and-Devops/tree/main/Lab/Experiment%2011/Readme.md"
  "https://github.com/Ayush-Narula-100/Container-and-Devops/tree/main/Lab/Experiment%2012/Readme.md"

)

# ===== GENERATE PDF =====
pandoc "${URLS[@]}" \
  -o output.pdf \
  --pdf-engine=xelatex \
  --toc \
  --number-sections \
  --listings \
  --wrap=none \
  -V geometry:margin=1in \
  -M title="$TITLE" \
  -M author="$AUTHOR ($SAPID)"
