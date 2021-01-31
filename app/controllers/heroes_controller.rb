class HeroesController < ApplicationController
  include HeroesService
  include CredlyService
  require 'pry'
  before_action :set_hero_value, only: [:index]

  def index; end

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
    heroes_found = HeroesService::Search.by_name_begins_with(hero_name)
    credly_badges = CredlyService::Badge.get_badge_templates()
    return nil if response.status != 200
    JSON.parse(heroes_found.body)
   end

   def set_hero_value
    @heroes = []
   end 

end
