/// The type of data to convert into from extracted information
/// Type explained:
///   - [RAW]       Keep the information as raw string, don't transform
///   - [LINK]      Transform the information into an [Uri]
///   - [META]      Reserved for additional information that not fall into other cases
enum DataType { RAW, LINK, META }
