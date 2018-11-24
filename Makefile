test: generate-json-serializable-code
	@pub run test

format-code:
	@dartfmt -w --fix .

generate-json-serializable-code: get-packages
	@pub run build_runner build --delete-conflicting-outputs --low-resources-mode

clean-generated-code:
	@pub run build_runner clean

get-packages: pubspec.yaml .packages
	@pub get

upgrade-packages: pubspec.yaml .packages
	@pub upgrade
