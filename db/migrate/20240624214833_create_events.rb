class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :status
      t.date :event_date
      t.float :price

      t.timestamps
    end
  end
end
