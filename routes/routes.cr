require "../controllers/default_controller"
require "../controllers/hero_controller"

module Rest
  include Controller
  def self.routes
    return [
      {
        controller: DefaultController,
        path:       "/*",
      },
      {
        controller: HeroController,
        path:       "/heroes",
      },
    ]
  end
end