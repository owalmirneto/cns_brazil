require 'rspec'
require 'active_model'
require 'shoulda-matchers'

RSpec.configure do |config|
  config.include Shoulda::Matchers::ActiveModel
end

Dir[File.expand_path('lib/**/*.rb')].each { |f| require f }
Dir[File.expand_path('spec/faker/**/*.rb')].each { |f| require f }

