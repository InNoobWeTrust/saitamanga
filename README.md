# App design

## Parse config generation

1. Source config file in `Json` or `Yaml`
2. Generate `Source` object. Content:
    - `Category` processor
    - `Manga` processor
    - `Chapter` processor
    - `Page` processor

### Processor content

1. Raw element parser
2. Info filter
3. Segments generator
4. Segment processor (transform `ParseProduct`)

## Parsed raw object

1. `ParseProduct` fields:
    - `Primary` field -> `List<String>`
    - `Link` field -> `List<Uri>`
    - `Meta` field -> `Map<String, List<String>`

## Request option

1. A `ParseElement` for preloaded page
2. Fields:
    - `text`: user input as text, accept regex validator
    - `number`: user input as number, accept type enforcer (default to `int`)
    - `radio`: single choice
    - `checkbox`: multiple choices

## Usage

1. Choose a `Category` to load from the list provided by `Source` object
2. If there are request options that require preload, preload it
3. Pick preferred request option and fire a `Request` through `Proxy`
4. Process the `Response` to get `ParseProduct`
5. Generate `Category` with `Info` object obtained from processing `ParseProduct` then add first `CategorySegment`
6. If there is pagination, let the user manually follow the links to load and append `Segment` to `Category`
