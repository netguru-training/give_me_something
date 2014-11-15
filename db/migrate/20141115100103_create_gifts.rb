class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name
      t.text :description
      t.belongs_to :list, index: true
      t.belongs_to :buyer, index: true

      t.timestamps
    end
  end
end
