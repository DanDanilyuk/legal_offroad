class CreateForms < ActiveRecord::Migration[5.1]
  def change
    create_table :forms do |t|
      t.column :name_first_last, :string
      t.column :address_street, :string
      t.column :address_city, :string
      t.column :address_state, :string
      t.column :address_zip, :integer
      t.column :phone, :string
      t.column :email, :string
      t.column :social, :string
      t.column :vin, :string
      t.column :make, :string
      t.column :model, :string
      t.column :year, :integer
      t.column :cc, :integer
      t.column :color, :string
      t.column :purchase_date, :string

      t.timestamps
    end
  end
end
