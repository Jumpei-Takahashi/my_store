class StoresController < ApplicationController
  def index
    @q = Store.search(params[:q])
    @stores = @q.result.page(params[:page]).per(5).order(:id)
  end
  
  def show
    @store = Store.find(params[:id])
     if user_signed_in?
       if @store.reviews.select{|s| s.user_id == current_user.id}.length == 0
         @review = Review.new
       end
     end
  end
  
  def new
    @store = Store.new
    5.times do
      @store.store_images.build
    end
  end
  
  def confirm
    if params[:id].present?
      @store = Store.find(params[:id])
      @store.attributes = input_params
      @store.user_id = current_user.id
      if @store.invalid?
        flash.now[:alert] = @store.errors.full_messages
        render :edit
      elsif !@store.store_images.first.image?
        @store.errors[:base] << I18n.t('store.image_error')
        flash.now[:alert] = @store.errors.full_messages
        render :edit
      end
    else
      @store = Store.new(input_params)
      @store.user_id = current_user.id
      if @store.invalid?
        flash.now[:alert] = @store.errors.full_messages
        render :new
      elsif !@store.store_images.first.image?
        @store.errors[:base] << I18n.t('store.image_error')
        flash.now[:alert] = @store.errors.full_messages
        render :new
      end
    end
  end
  
  def create
    @store = Store.new(input_params)
    @store.user_id = current_user.id
    if params[:back]
      render :new
    else
      @store.save!
      flash[:notice] = I18n.t('store.created')
      redirect_to action: :index
    end
  end
  
  def edit
    @store = Store.find_by(id: params[:id], user_id: current_user.id)
  end
  
  def destroy
    store = Store.find_by(id: params[:id], user_id: current_user.id)
    store.destroy!
    flash[:notice] = I18n.t('store.deleted')
    redirect_to action: :index
  end
  
  private
  def input_params
    params.require(:store).permit(:title, :artist, :release_date, :comment, genre_ids: [], store_images_attributes: [:id, :image, :image_cache])
  end
end
