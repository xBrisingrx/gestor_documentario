class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :legajo, unique: true
      t.string :name, limit: 100
      t.string :last_name, limit: 100
      t.integer :dni, null: true
      t.boolean :dni_has_expiration, default: 0
      t.date :expiration_date_dni, null: true
      t.string :cuil, limit: 50, null: true
      t.date :birth_date, null: true
      t.string :nationality, limit: 50
      t.string :direction, null: true
      t.string :phone, limit: 20
      t.date :start_activity, null: true
      t.boolean :active, default: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
