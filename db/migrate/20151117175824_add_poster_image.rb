class AddPosterImage < ActiveRecord::Migration
  def change
    add_column :movies, :image, :string
  end

end

# puts "stuff"
# has_many :friends
# validates :something, presence: true