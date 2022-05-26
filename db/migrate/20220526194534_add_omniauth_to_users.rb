class AddOmniauthToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.column :provider, :string
      t.column :uid, :string
    end
  end
end
