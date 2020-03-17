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
require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
