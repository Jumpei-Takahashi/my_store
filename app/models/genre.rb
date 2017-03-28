class Genre < ActiveRecord::Base
    has_many :store_genres
    has_many :stores, through: :store_genres
    
    validates :name, presence: true
end
