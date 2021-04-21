require "db"
require "mysql"
require "dotenv"

Dotenv.load

class Hero
  # @@fields = {
  #   "id"    => Int32,
  #   "title" => String
  # } 

  @@db = ENV["DB"]

  def self.all
    items = [] of Hash(String, String|Int32)

    DB.open @@db do |db|
      db.query "select id, title from heroes" do |rs|
        rs.each do
          item = Hash(String, String|Int32).new
          item["id"] = rs.read(Int32)
          item["title"] = rs.read(String)
          items << item
        end
      end
    end
    items
  end

  def self.find(id)
    item = Hash(String, String|Int32).new

    DB.open @@db do |db|
      db.query "select id, title from heroes where id = #{id}" do |rs|
        rs.each do
          item["id"] = rs.read(Int32)
          item["title"] = rs.read(String)
        end
      end
    end
    item
  end
end