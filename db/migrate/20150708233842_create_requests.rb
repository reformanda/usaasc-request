class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :other_phone
      t.text :description

      t.timestamps null: false
    end
  end
end
