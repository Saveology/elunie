require 'simplecov'
SimpleCov.start
SimpleCov.at_exit do
  SimpleCov.result.format!
end


$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'bundler'

require 'elunie'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Bundler.require(:default, :development)

RSpec.configure do |config|
  config.mock_with :mocha
end

Mocha::Configuration.prevent(:stubbing_non_existent_method)

Debugger.start