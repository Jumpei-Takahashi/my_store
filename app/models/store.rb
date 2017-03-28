class Store < ActiveRecord::Base
    has_many :store_genres
    has_many :genres, through: :store_genres
    has_many :store_images, dependent: :destroy
    accepts_nested_attributes_for :store_images
    
    validates :title,           presence: true
    validates :artist,          presence: true
    validates :release_date,    presence: true
    validates :user_id,         presence: true
end
