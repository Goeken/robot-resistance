module CredlyService
  class Badge
    def self.find_org
      url = Rails.application.credentials.dig(:credly, :url)
   	  org = Rails.application.credentials.dig(:credly, :org)
   	  auth_token = Rails.application.credentials.dig(:credly, :auth_token)
      @org = Faraday.get "#{url}/organizations/#{org}"

    end
  end
end