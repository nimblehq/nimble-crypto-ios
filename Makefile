setup: install assets

install:
	brew install swiftgen
	brew install xcbeautify
	which swiftlint &>/dev/null || brew install swiftlint
	bundle config set --local path vendor/bundle
	bundle install

assets:
	swiftgen
