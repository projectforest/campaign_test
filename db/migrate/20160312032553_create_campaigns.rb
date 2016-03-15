class CreateCampaigns < ActiveRecord::Migration
  def change
    enable_extension "hstore"
    create_table :campaigns do |t|
      t.string :campaign_name
      t.float :price
      t.hstore :target_list, array: true
     

      t.timestamps null: false
    end
  end
end
