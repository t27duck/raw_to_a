require "bundler/setup"
require "raw_to_a"

db =  ENV['DB'] || 'sqlite'
ar =  ENV['AR'] || '4-2'

case db
when 'mysql'
  ActiveRecord::Base.establish_connection(
    adapter:  'mysql2',
    database: 'raw_to_a_test',
    encoding: 'utf8'
  )
when 'pg'
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    database: 'raw_to_a_test',
    min_messages: 'warning'
  )
else
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: ':memory:'
  )
end

ActiveRecord::Schema.define do
  self.verbose = false
  create_table :users, force: true do |t|
    t.string :username, null: false
    t.boolean :active, null: false, default: true
    t.timestamps
  end
end

class User < ActiveRecord::Base
end

10.times.each_with_index do |i|
  User.create!(
    username: "user#{i}",
    active: i % 2 == 1
  )
end

puts "TESTING WITH: ActiveRecord: #{ar} | Database: #{db}"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
