class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :password
      t.text :favoriteNpos
      t.text :favoriteBusinesses
      t.boolean :profilePicture, :default => false
      t.integer :hoursWorked, :default => 0
      t.integer :moneyRaised, :default => 0
      t.text :reviews
      t.text :currentProjects
      t.text :applications
      t.text :bio
      t.text :messageThreads

      t.timestamps null: false
    end
  end
end
