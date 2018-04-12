source 'https://rubygems.org'

# Specify your gem's dependencies in raw_to_a.gemspec
gemspec

rails = ENV['AR'] || '4-2'
case rails
when '5-0'
  gem 'activerecord', '~> 5.0.0'
when '5-1'
  gem 'activerecord', '~> 5.1.0'
else
  gem 'activerecord', '~> 4.2.0'
end

case ENV['DB'] || 'sqlite'
when 'mysql'
  if rails == '4-2'
    gem 'mysql2', '~> 0.3.18'
  else
    gem 'mysql2'
  end
when 'pg'
  if rails == '4-2'
    gem 'pg', '~> 0.18'
  else
    gem 'pg'
  end
else
  gem 'sqlite3'
end
