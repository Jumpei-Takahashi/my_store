class StoreGenre < ActiveRecord::Base
    belongs_to :store
    belongs_to :genre
end
