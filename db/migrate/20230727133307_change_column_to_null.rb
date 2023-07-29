class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :introduction, true
  end
end
