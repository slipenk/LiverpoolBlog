class AddSalahIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :salah_id, :integer
  end
end
