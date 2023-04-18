# Reverse Engineering Stuttgart Bürgerhaushalt

Reverse engineer to retrieve single entry by rating-position and display it.

## Call to

https://www.buergerhaushalt-stuttgart.de/views/ajax

Return type is array. 

Entry data resides in a block looking like this:

```json
[
    {
        "command": "insert",
        "method": "replaceWith",
        "selector": ".view-dom-id-xxxxxxxxxxxxxxxxxxx",
        "data": "\u003Cdiv class=\u0022view view-ergebnisse view-id-ergebnisse [... html]"
    }
]
```
## Format

Find | Replace
--- | ----
`\u003C` | `<`
`\u003E` | `>`
`\u0022` | `"`
`\\n` | `\n`
`\/` | `/`

## HTML

HTML container is `<div class="view-content">`

### One Entry (72378)

direct link for this one would be: https://www.buergerhaushalt-stuttgart.de/vorschlag/72378

[72378 HTML](./examples/one-entry.html)

id="node-72378"

# Mapping

CSV to json

REGEX Replace: `(\d+) \| (\d+) \| (.*)` with `"$1": {"id": "$2", "title": "$3"},`