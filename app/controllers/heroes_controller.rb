class HeroesController < ApplicationController
  include HeroesService
  include CredlyService
  def index; end

  def search
  	hero = find_hero(params[:hero_name])
	unless hero
	  flash[:alert] = 'No Heroes Found'
	  return render action: :index
	end
	@result_count = hero.count
	@heroes = hero["data"]["results"] 
  end 

  private

   def find_hero(hero_name)
    hero_response = HeroesService::Search.by_name_begins_with(hero_name)
    credly_response = CredlyService::Badge.find_org()
    return nil if response.status != 200
    @response = JSON.parse(hero_response.body)
   end

end
