class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :micropost, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps null: false
    end

    add_index :votes, [:user_id, :micropost_id], unique: true
  end
end
