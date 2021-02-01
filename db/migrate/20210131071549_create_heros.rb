class CreateHeros < ActiveRecord::Migration[6.0]
  def change
    create_table :heros do |t|
      t.text :name
      t.text :hero_id
      t.text :badge_template_id
      t.text :badge_id
      t.text :badge_name
      t.text :badge_skill
      t.text :badge_description
      t.text :badge_img
      t.text :description
      t.timestamps
    end
  end
end
