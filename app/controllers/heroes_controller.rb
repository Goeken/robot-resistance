class HeroesController < ApplicationController
  include HeroesService
  include CredlyService
  require 'pry'
  before_action :set_hero_value, only: [:index]
  before_action :set_rand_num, only: [:create]

  def index; end

  def create
    new_hero = Hero.create(hero_params)

    # Find the credly badge template. We will store it with the hero for later reference.
    credly_badges = CredlyService::Badge.get_all_badge_templates()

    # Issue a new Badge to the Hero
    issued_badge = CredlyService::Badge.issue_badge(new_hero.name + "@gmail.com", new_hero.name, new_hero.name, credly_badges["data"][@rand_num]["id"])

    # Assign the badge values to the hero model. We don't want to keep calling the API
    new_hero.update(badge_id: issued_badge["data"]["id"],
                    badge_template_id: credly_badges["data"][@rand_num]["id"],
                    badge_name: credly_badges["data"][@rand_num]["name"], 
                    badge_skill: credly_badges["data"][@rand_num]["skills"][0], 
                    badge_description: credly_badges["data"][@rand_num]["description"], 
                    badge_img: credly_badges["data"][@rand_num]["image_url"] )

    redirect_to root_path(:hero => new_hero.id), flash: { badge_modal: true }
  end

  def search
    # find_hero is found in services/heroes folder to help with API Call
  	@heroes = find_hero(params[:hero_name])
  	@hero_count = @heroes["data"]["count"]
  	@heroes = @heroes["data"]["results"] 
    # responding with a js since I only want to update the results section 
    # of the page without reloading the whole page.
    respond_to do |format|  
        format.js { render 'heroes/available'}
    end
  end 

  private

   def find_hero(hero_name)
    # name_begins_with search is in services/heroes to help with the api call
    heroes_found = HeroesService::Search.by_name_begins_with(hero_name)
    JSON.parse(heroes_found.body)
   end

   def set_hero_value
    @heroes = []
   end 

   def hero_params
    params.permit(:name, :hero_id)
   end

   def set_rand_num
    # There is only two badge templates available,
    # choose one at random since they are random heroes. 
      @rand_num = rand(0..1)
   end

end
