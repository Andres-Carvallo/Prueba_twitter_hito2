class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]

  # GET /likes
  # GET /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1
  # GET /likes/1.json
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # tweet /likes
  # tweet /likes.json
  def create
    if already_liked?
    else
      @user = current_user.id
      @tweet = params[:tweet_id]
      likes = {user_id: @user, tweet_id: @tweet}
      @like = Like.new(likes)
      @like.save!
      if @like.save
        redirect_to root_path
      else
       redirect_to root_path
      end

    end


  end

  # PATCH/PUT /likes/1
  # PATCH/PUT /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to @like, notice: 'Like was successfully updated.' }
        format.json { render :show, status: :ok, location: @like }
      else
        format.html { render :edit }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like.destroy
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    end

    # Only allow a list of trusted parameters through.

    def already_liked?
      Like.where(user_id: current_user.id, tweet_id:
      params[:tweet_id]).exists?
    end


   def find_tweet
    @tweet = Tweet.find(params[:tweet_id])
   end





end
