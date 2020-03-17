# == Schema Information
#
# Table name: searches
#
#  id         :bigint           not null, primary key
#  word       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Search < ApplicationRecord
  has_and_belongs_to_many :emails
end
