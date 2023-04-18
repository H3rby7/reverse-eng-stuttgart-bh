# Reverse Engineering Stuttgart Bürgerhaushalt

Reverse engineer to retrieve single entry by rating-position and display it.

State 2023-04-18

# One Entry

Direct link for an entry is: https://www.buergerhaushalt-stuttgart.de/vorschlag/${ID}.

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

## Map Rank to ID

1. Replace `"` with `\"` to escape `"`
2. REGEX Replace: `(\d+) \| (\d+) \| (.*)` with `"$1": {"id": "$2", "title": "$3"},`
3. Surround with `{}`
