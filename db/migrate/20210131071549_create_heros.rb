class CreateHeros < ActiveRecord::Migration[6.0]
  def change
    create_table :heros do |t|
      t.text :name
      t.timestamps
    end
  end
end
