class AddStatusToAlerts < ActiveRecord::Migration
  def change.
    add_column :alerts, :status, :integer
  end
end
