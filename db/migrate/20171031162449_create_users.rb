class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :password
      t.text :skills
      t.text :favoriteNpos
      t.text :favoriteBusinesses
      t.boolean :profilePicture
      t.integer :hoursWorked
      t.integer :moneyRaised
      t.text :reviews
      t.text :currentProjects
      t.text :applications
      t.text :bio
      t.text :messageThreads

      t.timestamps null: false
    end
  end
end
