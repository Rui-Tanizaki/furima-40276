class UserItems < ActiveRecord::Migration[7.0]
  def change
    create_table :user_items do |t|       
      t.references :item,       null: false, foreign_key: true #追加した行
      t.references :user,       null: false, foreign_key: true #追加した行
      t.timestamps
    end
  end
end
