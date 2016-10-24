class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :sent_id
      t.integer :receive_id
      t.string :title
      t.string :content
      t.boolean :read , default:false
      t.timestamps
    end
  end
end
