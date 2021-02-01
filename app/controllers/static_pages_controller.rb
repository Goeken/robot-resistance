class StaticPagesController < ApplicationController
  include CredlyService
  def home
  	@heroes = Hero.all
  	if params[:hero]
  		@new_hero = @heroes.find(params[:hero])
  		
  		#Didn't need this call after all since information is stored with the Hero model
  		@credly_badge = CredlyService::Badge.get_single_badge_template(@new_hero.badge_id)
  	end
  end
end
