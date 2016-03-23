class CreateNotenplans < ActiveRecord::Migration
  def change
    create_table :notenplans do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
