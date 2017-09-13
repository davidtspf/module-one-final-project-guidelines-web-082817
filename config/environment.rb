require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/library.db')
require_all 'lib'

ActiveRecord::Base.logger = nil
