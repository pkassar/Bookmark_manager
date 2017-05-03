require 'data_mapper'
require 'dm-postgres-adapter'

class Tags
  include DataMapper::Resource
  property :id, Serial
  property :tag1, String
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
