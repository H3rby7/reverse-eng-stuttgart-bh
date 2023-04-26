# Reverse Engineering Stuttgart Bürgerhaushalt

Reverse engineer to retrieve single entry by rating-position and display it.

State 2023-04-18

# One Entry

Direct link for an entry is: https://www.buergerhaushalt-stuttgart.de/vorschlag/${ID}

## HTML Contains

HTML content resides in `<div id="content">`

Field | xpath-ish
----- | ----
Title | `id="page-title"`
Author | `@class="username"`
Rating | `id="rate-node-71179-*"`
Description | `@class="field-body"`
Comments | `id="comments"`

# Process

1. Copied ranked view, as it displayed the elements in the form of `RANK | ID | TITLE`.
2. Saved that list as `.csv`
3. [Created a JSON that maps rank to ID/Title](#map-rank-to-id)

***NOTE: CSV has actually been modified afterwards to be displayable in github***

## Map Rank to ID

Created a JSON that maps rank to ID/Title

1. Replace `"` with `\"` to escape `"`
2. REGEX Replace: `(\d+) \| (\d+) \| (.*)` with `"$1": {"id": "$2", "title": "$3"},`
3. Surround with `{}`

## Generate Hyperlink

Replace `"id": "(\d+)"` with `"id": "$1", "href": "https://www.buergerhaushalt-stuttgart.de/vorschlag/$1"`
to add a direct-link to each json entry.

Can render all those direct links as:

    sh csv-to-md.sh 2023/ranking.csv 2023/README.md
    sh csv-to-html.sh 2023/ranking.csv 2023/index.html

For `md` also need to replace `\n\]` with `]`
