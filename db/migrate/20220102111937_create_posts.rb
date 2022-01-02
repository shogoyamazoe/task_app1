class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :startdate
      t.date :enddate
      t.boolean :check
      t.text :memo
      
      t.timestamps
    end
  end
end
