class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :ext_id,        :integer
  	add_column :users, :name,          :string
  	add_column :users, :start_deposit, :decimal
  	add_column :users, :total_deposit, :decimal
  	add_column :users, :total_cashout, :decimal
  	add_column :users, :ico,           :decimal
  	add_column :users, :crypto,        :decimal 	
  end
end
