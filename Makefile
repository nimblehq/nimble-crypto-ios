# Setup
setup: install generate

# Install dependencies
install:
	brew install swiftgen
	brew install xcbeautify
	which swiftlint &>/dev/null || brew install swiftlint
	bundle config set --local path vendor/bundle
	bundle install

# Generate Swift code for resources
generate:
	swiftgen

# Lint code
lint:
	swiftlint --strict
