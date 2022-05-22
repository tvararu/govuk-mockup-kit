class CreateExports < ActiveRecord::Migration[7.0]
  def change
    create_table :exports do |t|
      t.string :name, null: false
      t.references :journey, null: false, foreign_key: true
      t.binary :data, null: false

      t.timestamps
    end
  end
end
