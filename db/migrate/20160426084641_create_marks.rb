class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.float :mark
      t.float :weighting
      t.boolean :shorttest
      t.references :notenplan, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
