class CreateUsers < ActiveRecord::Migration
  def change
    enable_extension "hstore"
    create_table :users do |t|
      t.string :user_name
      t.hstore :profile, array: true

      t.timestamps null: false
    end
  end
end
