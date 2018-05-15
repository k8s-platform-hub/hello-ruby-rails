class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name
    end

    Author.create(name: 'Chrissie')
    Author.create(name: 'Aubrey')
  end
end