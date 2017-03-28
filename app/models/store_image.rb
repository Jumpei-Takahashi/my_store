class StoreImage < ActiveRecord::Base
    belongs_to :store
    
    mount_uploader :image, StoreImageUploader
    
end
