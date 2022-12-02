setup:
	which swiftlint &>/dev/null || brew install swiftlint
	bundle config set --local path vendor/bundle
	bundle install
