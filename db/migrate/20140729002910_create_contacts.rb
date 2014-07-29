class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email
      t.integer :agent_id

      t.timestamps
    end
  end
end
