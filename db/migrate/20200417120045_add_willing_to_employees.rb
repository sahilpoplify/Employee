class AddWillingToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :willing, :boolean, :default => false 
  end
end
