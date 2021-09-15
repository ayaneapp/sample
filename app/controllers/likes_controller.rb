class LikesController < ApplicationController
   
   @tweet = Tweet.left_outer_joins(:likes).group('tweets.id').select('tweets.*, COUNT(likes.*) AS likes_count').distinct.reorder(likes_count: :desc).limit(100)
    def create
        @tweet = Tweet.find(params[:tweet_id])
        @alreadylike = Like.find_by(ip: request.remote_ip, tweet_id: params[:tweet_id])
        if @alreadylike
           redirect_back(fallback_location: root_path)
           flash[:notice] = "すでにいいねしています"
        else
           @like = Like.create(tweet_id: params[:tweet_id], ip: request.remote_ip)
           redirect_back(fallback_location: root_path)
        end
      end
end
