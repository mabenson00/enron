# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many :recipient_user_emails
    has_many :sender_user_emails
    has_many :sent_emails, through: :sender_user_emails, source: :email
    has_many :received_emails, through: :recipient_user_emails, source: :email

    def emails 
        sent_emails + received_emails
    end
end
