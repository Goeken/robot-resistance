# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
  	@heroes = Hero.all
  end
end
