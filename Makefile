# Setup
setup: install

# Install dependencies
install:
	brew install xcbeautify
	which swiftlint &>/dev/null || brew install swiftlint
	bundle config set --local path vendor/bundle
	bundle install

# Lint code
lint:
	swiftlint --strict
