require "../models/hero"
require "db"
require "mysql"

module Rest
  module Controller
    
    class HeroController < Shivneri::Controller

      @[Worker("GET")]
      @[Route("/")]
      def all_heroes
        heroes = Hero.all
        return json_result(heroes)
      end
      
      @[Worker("GET")]
      @[Route("/{hero_id}")]
      def get_user
        hero_id = param["hero_id"].to_i
        hero = Hero.find(hero_id)
        if (hero != nil)
          return json_result(hero)
        else
          return text_result("invalid hero id", 404)
        end
      end

    end
                          
  end
end