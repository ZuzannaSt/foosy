class CreatePlayerMatches < ActiveRecord::Migration
  def change
    create_table :player_matches do |t|
      t.belongs_to :player, index: true
      t.belongs_to :match, index: true
      t.integer :result

      t.timestamps null: false
    end
  end
end
