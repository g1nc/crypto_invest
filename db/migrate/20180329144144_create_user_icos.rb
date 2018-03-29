class CreateUserIcos < ActiveRecord::Migration[5.1]
  def change
    create_table :user_icos do |t|
	  t.references :user
	  t.references :ico
	  t.decimal    :value
      t.timestamps
    end
  end
end
