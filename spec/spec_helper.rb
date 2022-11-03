require 'rspec'
require 'active_model'

Dir[File.expand_path('lib/**/*.rb')].each { |f| require f }
Dir[File.expand_path('spec/faker/**/*.rb')].each { |f| require f }

