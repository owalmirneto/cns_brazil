# frozen_string_literal: true

require 'rspec'
require 'active_model'
require 'coveralls'
require 'shoulda-matchers'

RSpec.configure do |config|
  config.include Shoulda::Matchers::ActiveModel
end

Coveralls.wear!

Dir[File.expand_path('lib/**/*.rb')].sort.each { |f| require f }
Dir[File.expand_path('spec/faker/**/*.rb')].sort.each { |f| require f }
