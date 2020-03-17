class CreateSenderUserEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :sender_user_emails do |t|
      t.references :user, foreign_key: true
      t.references :email, foreign_key: true

      t.timestamps
    end
  end
end
