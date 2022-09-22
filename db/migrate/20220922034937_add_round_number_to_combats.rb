class AddRoundNumberToCombats < ActiveRecord::Migration[7.0]
  def change
    add_column :combats, :round, :integer
  end
end
