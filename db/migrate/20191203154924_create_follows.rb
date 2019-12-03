class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :followee_id
      t.timestamps
    end
    add_index :follows, :user_id
    add_index :follows, :followee_id
  end
end
