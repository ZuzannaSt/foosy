class AddDefaultResultToPlayerMatch < ActiveRecord::Migration
  def change
    change_column_default :player_matches, :result, 0
  end
end
