class AddCleanedUrlForUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :url_clean, :text
  end
end
