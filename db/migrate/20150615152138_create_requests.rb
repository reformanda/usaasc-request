class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :other_phone
      t.boolean :laptop_issue
      t.text :laptop_desc
      t.boolean :software_issue
      t.text :software_desc
      t.boolean :blackberry_issue
      t.text :blackberry_desc
      t.boolean :email_issue
      t.text :email_desc
      t.boolean :pst_issue
      t.text :pst_desc
      t.boolean :shared_folder_issue
      t.text :shared_folder_desc
      t.boolean :other_hardware_issue
      t.text :other_hardware_desc
      t.boolean :air_card_issue
      t.text :air_card_desc
      t.boolean :other_issue
      t.text :other_issue

      t.timestamps null: false
    end
  end
end
