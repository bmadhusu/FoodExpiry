class CreateFoods < ActiveRecord::Migration
  def up
    create_table 'foods' do |t|
      t.integer :user_name_id
      t.string 'food_name'
      t.date 'expires_on'
      t.string 'alt_name'
      t.integer :qty
      t.string :brand
      t.string :unit
      t.date 'acquired_on'
      t.float :price
      t.string :food_type

      t.timestamps
      end   
  end

  def down
    drop_table 'foods'
  end
end
