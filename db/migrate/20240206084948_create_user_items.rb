class CreateUserItems < ActiveRecord::Migration[7.0]
  def change
    create_table :user_items do |t|
      t.string     :nickname,   null: false  
      t.string     :item_name,  null: false  
      t.integer    :price,      null: false         
      t.references :order,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
