class TweetsController < ApplicationController
    def index
        if params[:search] == nil
          @tweets= Tweet.all
        elsif params[:search] == ''
          @tweets= Tweet.all
        else
          @tweets = Tweet.where("lyrics LIKE ? ",'%' + params[:search] + '%')
          @tweets = Tweet.where("title LIKE ? ",'%' + params[:search] + '%')
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
      @tweet = Tweet.new
    end
    
      private
    def tweet_params
      params.require(:tweet).permit(:title, :singer, :lyrics, :link, :feeling, { feeling: [] })
    end
end
