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

    def self.issue_badge(recipient_name, badge_template_id)
      email = recipient_name.gsub(/\s+/, "")
      email = email.gsub(/[^0-9a-z ]/i, '') + "@gmail.com"
   	  connection = Faraday.new(url: "#{URL}#{ORG}/badges")
	    connection.basic_auth(AUTH_TOKEN, '')     
      response = connection.post '', { recipient_email: email, issued_to_first_name: recipient_name, issued_to_last_name: recipient_name, badge_template_id: badge_template_id, issued_at: Time.now }
      return JSON.parse(response.body)
    end
  end
end