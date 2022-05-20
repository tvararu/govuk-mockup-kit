class MakeTitlesNotNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :journeys, :title, false
    change_column_null :pages, :title, false
  end
end
