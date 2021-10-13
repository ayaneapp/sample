class TweetsController < ApplicationController
    def index
        if params[:feeling] == nil
          @tweets = Tweet.order("RANDOM()").limit(20)
        elsif params[:feeling] == ''
          @tweets = Tweet.order("RANDOM()").limit(20)
        else
          @tweets = Tweet.where("feeling LIKE ? ",'%' + params[:feeling] + '%')
        end
    end

    def new
        @tweet = Tweet.new
    end

    def create
        tweet = Tweet.new(tweet_params)
        if tweet.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
      @tweet = Tweet.find(params[:id])
    end
    
    def search
      feeling_ids = Submit.where("feeling = ?", params[:feeling]) .pluck(:id)
      
      @tweet.feeling= Submit.where("tweet_id IN (?) or tweet_id IN (?)", feeling_ids)
    end

    def about
      @tweets= Tweet.all

    end
    
      private
    def tweet_params
      params.require(:tweet).permit(:title, :singer, :lyrics, :lyricist, :link, :feeling, { feeling: [] })
    end
end
