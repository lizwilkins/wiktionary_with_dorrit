class CreateEntries < ActiveRecord::Migration

  def change
    create_table :entries do |t| 
      t.column :word, :string
      t.column :definition, :string

      t.timestamps
    end
  end
end
