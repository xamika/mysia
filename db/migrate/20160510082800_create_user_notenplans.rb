class CreateUserNotenplans < ActiveRecord::Migration
  def change
    create_table :user_notenplans do |t|
      t.references :user, index: true, foreign_key: true
      t.references :notenplan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
