class CreateCauses < ActiveRecord::Migration[5.1]
  def change
    create_table :causes do |t|
      t.string :name
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
