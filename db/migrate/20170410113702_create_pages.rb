class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.text :url, null: false
      t.integer :status, default: 0, null: false
    end
  end
end
