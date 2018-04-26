/// Use this to filter out undesired manga
/// Another consideration is to conform with the term of app stores
/// Rating system derived from this reference:
/// [https://www.thoughtco.com/introduction-to-age-ratings-2283001]
/// 
/// Rating explained:
///     Unknown:      age rating not available, reserved as a fallback, not recommended
///     Everyone:     age 6+, a.k.a "All Ages"
///     Youth:        age 10+
///     Teens:        age 13+
///     OlderTeens:   age 16+
///     Mature:       age 18+
///     Wizard:       age 30+, reserved for extreme condition
enum AgeRating {
  Unknown,
  Everyone,
  Youth,
  Teens,
  OlderTeens,
  Mature,
  Wizard
}