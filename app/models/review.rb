class Review < ActiveRecord::Base
    belongs_to :store
    belongs_to :user
    
    validates :store_id, presence: true
    validates :user_id,  presence: true
    validates :body,     presence: true, allow_blank: false
end
