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
    has_many :comments, -> { joins(:recipient, :sender) }, class_name: 'Comment'
    has_many :emails, through: :comments
end
