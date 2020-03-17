class CreateSenders < ActiveRecord::Migration[5.2]
  def change
    create_table :senders do |t|
      t.references :user, foreign_key: true
      t.references :email, foreign_key: true

      t.timestamps
    end
  end
end
