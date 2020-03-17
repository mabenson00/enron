class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :word

      t.timestamps
    end

    create_table :emails_searches, id: false do |t|
      t.belongs_to :email
      t.belongs_to :search
    end

    add_index :searches, :word, unique: true
  end
end
