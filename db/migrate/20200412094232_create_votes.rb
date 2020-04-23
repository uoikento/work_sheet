class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|

      t.timestamps
      t.integer :role
      t.references :question, foreign_key: true
      t.references :option, foreign_key: true
    end
  end
end
