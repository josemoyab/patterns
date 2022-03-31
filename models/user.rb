require 'connection_adapter'

class User < ActiveRecord::Base
  @@connection = SqliteAdapter.new

  def initialize(attributes)
    @attributes = attributes
  end

  def id
    @attributes[:id]
  end

  def name
    @attributes[:name]
  end

  def self.find(id)
    find_by_sql("SELECT * FROM users WHERE id = #{id.to_i} LIMIT 1").first
  end

  def self.find_by_sql(sql)
    rows = @@connection.execute(sql)

    rows.map{ |row| new(**row)}
  end

end