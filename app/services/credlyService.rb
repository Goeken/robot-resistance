module CredlyService
  class Badge
  	URL = Rails.application.credentials.dig(:credly, :url)
  	ORG = Rails.application.credentials.dig(:credly, :org)
  	AUTH_TOKEN = Rails.application.credentials.dig(:credly, :auth_token)

    def self.get_single_badge_template(badge_id)
   	  connection = Faraday.new(url: "#{URL}#{ORG}/badge_templates/#{badge_id}")
	    connection.basic_auth(AUTH_TOKEN, '')     
      response = connection.get('')
      return JSON.parse(response.body)
    end

    def self.get_all_badge_templates()
      connection = Faraday.new(url: "#{URL}#{ORG}/badge_templates")
      connection.basic_auth(AUTH_TOKEN, '')     
      response = connection.get('')
      return JSON.parse(response.body)
    end

    def self.issue_badge(recipient_email, first_name, last_name, badge_template_id)
   	  connection = Faraday.new(url: "#{URL}#{ORG}/badges")
	    connection.basic_auth(AUTH_TOKEN, '')     
      response = connection.get '', { recipient_email: recipient_email, issued_to_first_name: first_name, issued_to_last_name: last_name, badge_template_id: badge_template_id, issued_at: Time.now }
      return JSON.parse(response.body)
    end
  end
end