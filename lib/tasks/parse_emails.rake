# frozen_string_literal: true

namespace :parse_emails do
    desc "parsing_emails"
  
    task :run do
			require "mail"
			require_relative '../../app/services/parsing_service'
			files = Dir.glob("#{Rails.root}/inbox_test/*")
			
			files.each do |file|
				decoded_email = Mail.read(file)
				service = ParsingService.new(decoded_email)
				email_record = service.create_email
				service.attach_users
			end
     
		end
  end