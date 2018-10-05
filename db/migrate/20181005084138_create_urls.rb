class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.text :url_orginal
      t.text :url_short
      t.timestamps
    end
  end
end
