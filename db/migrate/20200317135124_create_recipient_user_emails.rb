class CreateRecipientUserEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :recipient_user_emails do |t|
      t.references :user, foreign_key: true
      t.references :email, foreign_key: true

      t.timestamps
    end
  end
end
