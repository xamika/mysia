class CreateGardes < ActiveRecord::Migration
  def change
    create_table :gardes do |t|
      t.references :notenplan, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true
      t.float :garde
      t.float :weighting
      t.boolean :shorttest

      t.timestamps null: false
    end
  end
end
