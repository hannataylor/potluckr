class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :location, null: false
      t.date :date, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.references :host

      t.timestamps null: false
    end
  end
end
