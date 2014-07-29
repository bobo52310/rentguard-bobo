class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :title
      t.integer :contact_id

      t.timestamps
    end
  end
end
