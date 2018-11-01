/// The id for [ParseElementConfig]. UI will need this to information in a nice way
///   - [category]: Category links and related metadata
///   - [category__title]: Category's title
///   - [category__cover]: Category's cover image
///   - [category__description]: Category's description
///   - [album]: Album links and related metadata
///   - [album__title]: Album's title
///   - [album__cover]: Album's cover image
///   - [album__description]: Album's description
///   - [collage]: Collage links and related metadata
///   - [collage__title]: Collage's title
///   - [collage__cover]: Collage's cover
///   - [collage__desscription]: Collage's description
///   - [collage__picture]: Collage's picture to view
///   - [pagination]: A pagination for quick navigating between data pages
///   - [prev]: Link to previous data page
///   - [next]: Link to next data page
enum Id {
  category,
  category__title,
  category__cover,
  category__description,
  album,
  album__title,
  album__cover,
  album__description,
  collage,
  collage__title,
  collage__cover,
  collage__desscription,
  collage__picture,
  pagination,
  prev,
  next,
}
