class CreateChampions < ActiveRecord::Migration
  def change
    create_table :champions do |t|
    	t.string :key
      t.string :name
      t.string :title
      t.string :partype
      t.text :lore
      t.text :blurb
      t.timestamps
    end
  end
end
