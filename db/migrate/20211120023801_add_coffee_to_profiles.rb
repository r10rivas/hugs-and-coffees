class AddCoffeeToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :amount_coffee, :decimal
    add_column :profiles, :currency_symbol, :string
  end
end
