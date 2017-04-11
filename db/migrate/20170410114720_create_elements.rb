class CreateElements < ActiveRecord::Migration[5.0]
  def change
    create_table :elements do |t|
      t.text :content
      t.string :element_type, null: false
      t.references :page, foreign_key: true
    end
  end
end
