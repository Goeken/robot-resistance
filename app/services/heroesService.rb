require 'digest/md5' 
require 'date'
module HeroesService
  class Search
    def self.by_name_begins_with(hero_name)
      url = Rails.application.credentials.dig(:marvel, :url)
   	  public_key = Rails.application.credentials.dig(:marvel, :public_key)
   	  private_key = Rails.application.credentials.dig(:marvel, :private_key)
   	  time_stamp = Time.now.to_i
   	  hash_key = Digest::MD5.hexdigest(time_stamp.to_s + private_key + public_key)
      Faraday.get "#{url}?nameStartsWith=#{hero_name}&apikey=#{public_key}&ts=#{time_stamp.to_s}&hash=#{hash_key}"
    end
  end
end