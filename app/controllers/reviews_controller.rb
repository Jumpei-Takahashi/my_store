class ReviewsController < ApplicationController
    def create
        review = Review.new
        review.attributes = input_params
        review.user_id = current_user.id
        if review.valid? 
            review.save!
            flash[:notice] = I18n.t('review.created')
            redirect_to store_path(review.store_id)
        else
            flash[:alert] = review.errors.full_messages
            redirect_to request.referer
        end
    end
    
    def destroy
        review = Review.find(params[:id])
        store_id = review.store_id
        review.destroy!
        flash[:notice] = I18n.t('review.deleted')
        redirect_to store_path(restaurant_id)
    end
    
    private
    
    def input_params
    params.require(:review).permit(:store_id, :body)
    end

end
