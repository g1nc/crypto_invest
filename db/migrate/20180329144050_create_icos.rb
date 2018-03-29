class CreateIcos < ActiveRecord::Migration[5.1]
  def change
    create_table :icos do |t|
	  t.string  :name
	  t.decimal :percent
      t.timestamps
    end
  end
end
