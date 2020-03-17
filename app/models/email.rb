# == Schema Information
#
# Table name: emails
#
#  id         :bigint           not null, primary key
#  body       :string
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Email < ApplicationRecord
    has_many :sender_user_emails
    has_many :recipient_user_emails
    has_many :senders, through: :sender_user_emails, source: :user
    has_many :recipients, through: :sender_user_emails, source: :user

    def sender 
      senders.last
    end

    def recipient 
      recipients.last
    end
end
