/// The target data type to preprocess raw data into
///   - [string]: Intended to use with custom scripting parser
///   - [xml]: Currently there are no supported parsers for this, so unimplemented
///   - [dom]: The general supported target - HTML Document, parsers should be available on all platforms
///   - [json]: Currently there are no supported parsers for this, don't use this
///   - [yaml]: Currently there are no supported parsers for this, don't use this
enum PreprocessType {
  string,
  xml,
  dom,
  json,
  yaml,
}
