require 'raw_to_a/version'
require 'active_record'

module RawToA
  module ActiveRecord
    def raw_to_a
      connection.exec_query(all.to_sql).to_a
    end
  end
end

ActiveRecord::Base.extend(RawToA::ActiveRecord)
