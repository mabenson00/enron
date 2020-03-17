# == Schema Information
#
# Table name: recipients
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_recipients_on_email_id  (email_id)
#  index_recipients_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (email_id => emails.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class RecipientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
