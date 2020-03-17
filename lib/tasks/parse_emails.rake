# frozen_string_literal: true

#rake parse_emails:parse
namespace :parse_emails do
    desc "parsing_emails"
  
    task :parse do
			require "mail"
			require_relative '../../app/services/parsing_service.rb'
			require_relative '../../app/services/word_service.rb'

			# the files I'm searching are just a sample
			files = Dir.glob("#{Rails.root}/inbox_test/*")
			

			files.each do |file|
				#use mail gem to read email file
				decoded_email = Mail.read(file)

				#skip if the file isnt an email
				next unless decoded_email

				# go through each file and create an email record, and a user record (if necessary)
				# app\services\parsing_service.rb
				parse_service = ParsingService.new(decoded_email)
				email_record = parse_service.create_email
				parse_service.attach_users

				# To save time searches will be saved many to many with emails
				# To start, each email will find every word and either create a search record, or add it to the existing search record
				# app\services\word_service.rb
				word_service = WordService.new(email_record)
				word_service.parse_words
			end
		end
  end