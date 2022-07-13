class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, limit: 100, null: false
      t.string :description
      t.integer :d_type
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
