class CreateHeros < ActiveRecord::Migration[6.0]
  def change
    create_table :heros do |t|
      t.text :name
      t.text :hero_id
      t.text :badge_id
      t.text :description
      t.text :thumbnail
      t.timestamps
    end
  end
end
