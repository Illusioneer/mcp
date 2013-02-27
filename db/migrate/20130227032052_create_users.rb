class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :fullname
      t.string :email
      t.string :phone
      t.string :password
      t.hstore :metadata

      t.timestamps
    end
  end
end
