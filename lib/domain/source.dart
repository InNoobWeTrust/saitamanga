class Source {
	final String name;
	final String lang;
	List<String> origins;

	Source(this.name, this.lang) {
		assert(this.name != null && this.name.isNotEmpty);
		assert(this.lang != null && this.lang.isNotEmpty);
	}
}