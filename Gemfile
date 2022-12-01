# frozen_string_literal: true

source "https://rubygems.org"

# fastlane is the easiest way to automate beta deployments and releases for your iOS and Android apps. 
gem "fastlane"

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
