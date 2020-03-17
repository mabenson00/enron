class ParsingService    
    def initialize(decoded_email, email_record = nil)
                @decoded_email = decoded_email
                @logger ||= Logger.new("#{Rails.root}/log/parse_emails.log")
    end

	def create_email
        @email_record =	Email.create!(subject: @decoded_email.subject, body: @decoded_email.decoded.squish)	
        @logger.info("email successfully created with subject #{@email_record.subject}")

        @email_record
    end

    def attach_users
        set_senders(@decoded_email, @email_record)
        set_recipients(@decoded_email, @email_record)
    end

    def set_senders(decoded_email, email_record)
        senders = decoded_email.from
        senders.each do |sender_email|
            sender = get_sender(sender_email)
            email_record.senders << sender
            email_record.save
        end
    end

    def set_recipients(decoded_email, email_record)
				recipients = decoded_email.to
        recipients&.each do |recipient_email|
            recipient = get_recipient(recipient_email)
            email_record.recipients << recipient
            email_record.save
        end
    end

    def get_sender(sender_email)
        sender = User.find_by(email: sender_email)
        @logger.info("user found with email #{sender&.email || 'not found'}")
        return sender if sender

        sender = create_user(sender_email)
        @logger.info("user successfully created with email #{sender.email}")

        sender
    end

    def get_recipient(recipient_email)
        recipient = User.find_by(email: recipient_email)
        @logger.info("user found with email #{recipient&.email || 'not found'}")
        return recipient if recipient

        recipient = create_user(recipient_email)
        @logger.info("user successfully created with email #{recipient.email}")
        recipient
    end

    def create_user(email)
        User.create!(email: email)
    end
end