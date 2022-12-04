setup:
	which swiftlint &>/dev/null || brew install swiftlint
	brew install xcbeautify
	bundle config set --local path vendor/bundle
	bundle install
