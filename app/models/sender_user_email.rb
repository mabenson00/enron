# == Schema Information
#
# Table name: sender_user_emails
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_sender_user_emails_on_email_id  (email_id)
#  index_sender_user_emails_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (email_id => emails.id)
#  fk_rails_...  (user_id => users.id)
#
class SenderUserEmail < ApplicationRecord
  belongs_to :user
  belongs_to :email
end
