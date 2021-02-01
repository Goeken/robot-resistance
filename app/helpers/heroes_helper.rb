module HeroesHelper
	include CredlyService
	#For the view, before selcting a hero, check if we already selected them
	def check_if_recruited(hero_id)
		return Hero.where(hero_id: hero_id).exists? ? false : true
	end
	def get_badge(badge_id)
		CredlyService::Badge.get_single_badge_template(badge_id)
	end
end