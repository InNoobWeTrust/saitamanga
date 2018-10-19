/// Use this to filter out undesired manga
/// Another consideration is to conform with the term of app stores
/// Rating system derived from this reference:
/// https://www.thoughtco.com/introduction-to-age-ratings-2283001
///
/// Rating explained:
///   - [UNKNOWN]      age rating not available, reserved as a fallback, not recommended
///   - [EVERYONE]     age 6+, a.k.a "All Ages"
///   - [YOUTH]        age 10+
///   - [TEENS]        age 13+
///   - [OLDER_TEENS]   age 16+
///   - [MATURE]       age 18+
///   - [WIZARD]       age 30+, reserved for extreme condition
enum AgeRating {
  UNKNOWN,
  EVERYONE,
  YOUTH,
  TEENS,
  OLDER_TEENS,
  MATURE,
  WIZARD,
}
