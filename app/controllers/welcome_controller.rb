class WelcomeController < ApplicationController

  def home
    @message = "This is the root route!"

    #When not signed in(
        #Home  will need an API query that gets general top news

        #Depending on how that plays out, you may need a separate query if the user searches

        #Do you want the user to search? or have drop down of sources?
        #)
        if (!current_user)
          puts 'NO ONE'
        end




    # puts "RESPONSE", @response.inspect

    #When signed in(
        #Home  will need an API query that gets top news of favorited sources OR top if none are selected

        #Do you want the user to search? or have drop down of sources?
    #)

      if (current_user) # if someone signed in
        @user = User.find(current_user.id)
        @user_favorites = @user.favorites # arr

        @response_arr = []

        @user_favorites.each do |favorite|
          puts "favorite.source:", favorite.source
          @response = HTTParty.get("https://newsapi.org/v1/articles?source=#{favorite.source}&apiKey=#{ENV['NEWS_API_KEY']}")
          @response_arr.push(@response)
        end

        # puts "RESPONSE ARR", @response_arr.inspect

        @response_arr.each do |response|
          puts "RESPONSE ARR EACH"
          puts response.inspect
        end



     else # if someone not signed in
       @response = HTTParty.get("https://newsapi.org/v1/articles?source=techcrunch&apiKey=#{ENV['NEWS_API_KEY']}")
       puts "RESPONSE", @response.inspect
       puts "KEY", ENV['NEWS_API_KEY']
     end
  end



  def index
    @response
  end

  def news

   @source = params["source"]



     @response = HTTParty.get("http://www.newsapi.org/v1/articles?source=#{@source}&apiKey=#{ENV['NEWS_API_KEY']}")
     puts "RESPONSE", @response.inspect

  end

end
