class AddOauthInfoToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.column :image, :string, null: false
      t.column :name, :string, null: false
      t.column :nickname, :string, null: false
    end
  end
end
