class ApiController < InheritedResources::Base

  def new
    respond_to do |format|
      format.html { render "apis/new", :layout => false  }
    end

    @tweets = Tweet.all
    @users = User.all
    @tweet_api = []
    @likes = Like.all

    @tweets.each do |tweet|
      @tweets_likes = Like.where(:tweet_id  => tweet.id)
      @tweet_retweet = Tweet.where(:origin_tweet => tweet.id)
      @retweets_from = Tweet.where()

      @tweet_hash = {"id" => tweet.id}
      @tweet_hash.merge!("content"=> tweet.content)
      @tweet_hash.merge!("user_id"=> tweet.user_id)
      @tweet_hash.merge!("like_count"=> @tweets_likes.count)
      @tweet_hash.merge!("retweets_count"=> @tweet_retweet.count)
      @tweet_hash
      @tweet_api << (@tweet_hash)
    
    end

    @tweet_api






   
   
    
  
  end

  

  private

    def api_params
      params.require(:api).permit()
    end

end
