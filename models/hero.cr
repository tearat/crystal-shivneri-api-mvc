require "db"
require "mysql"
require "dotenv"
require "json"

Dotenv.load

struct HeroStruct
  property id, title

  def initialize(@id : Int32, @title : String)
  end

  def to_json(json : JSON::Builder)
    json.object do
      json.field "id", self.id
      json.field "title", self.title
    end
  end
end

class Hero
  @@db = ENV["DB"]

  def self.all
    items = [] of HeroStruct

    DB.open @@db do |db|
      db.query "select id, title from heroes" do |rs|
        rs.each do
          item = HeroStruct.new(rs.read(Int32), rs.read(String))
          items << item
        end
      end
    end
    items
  end

  def self.find(id)
    items = [] of HeroStruct

    DB.open @@db do |db|
      db.query "select id, title from heroes where id = #{id}" do |rs|
        rs.each do
          item = HeroStruct.new(rs.read(Int32), rs.read(String))
          items << item
        end
      end
    end

    return nil if items.size < 1

    items[0]
  end
end