class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false

      t.references :user
      t.references :event

      t.timestamps null: false
    end
  end
end
