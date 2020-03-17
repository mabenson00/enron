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
    has_many :senders
    has_many :recipients
end
