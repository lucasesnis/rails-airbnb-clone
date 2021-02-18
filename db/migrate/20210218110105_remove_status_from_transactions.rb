class RemoveStatusFromTransactions < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :status, :boolean
  end
end
