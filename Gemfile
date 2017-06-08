source 'https://rubygems.org'

# Specify your gem's dependencies in raw_to_a.gemspec
gemspec

case ENV['AR'] || '4-2'
when '5-0' then gem('activerecord', '~> 5.0.0')
when '5-1' then gem('activerecord', '~> 5.1.0')
else gem('activerecord', '~> 4.2.0')
end

case ENV['DB'] || 'pg'
when 'mysql' then gem('mysql2')
else gem('pg')
end
