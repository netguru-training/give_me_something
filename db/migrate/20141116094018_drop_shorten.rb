class DropShorten < ActiveRecord::Migration
  def down
    drop_table :shortened_urls
  end
end
