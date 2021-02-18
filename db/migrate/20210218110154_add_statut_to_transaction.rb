class AddStatutToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :statut, :string
  end
end
