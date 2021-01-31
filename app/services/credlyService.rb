module CredlyService
  class Badge
  	URL = Rails.application.credentials.dig(:credly, :url)
  	ORG = Rails.application.credentials.dig(:credly, :org)
  	AUTH_TOKEN = Rails.application.credentials.dig(:credly, :auth_token)

    def self.get_badge_templates
   	  connection = Faraday.new(url: "#{URL}#{ORG}")
	  connection.basic_auth(AUTH_TOKEN, '')     
      response = connection.get('')
      return response.body
    end

    def self.issue_badge(recipient_email, first_name, last_name, badge_template_id)
   	  connection = Faraday.new(url: "#{URL}#{ORG}")
	  connection.basic_auth(AUTH_TOKEN, '')     
      response = connection.get '', { recipient_email: reciepient_email, issued_to_first_name: first_name, issued_to_last_name: last_name, badge_template_id: badge_template_id, issued_at: Time.now }
      return response.body
    end
  end
end