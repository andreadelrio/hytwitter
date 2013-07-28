module TweetsHelper

	# def tweet_length (tweet)
	# 	largo = tweet.content.length
	# 	if largo > 1
	# 		"This tweet has #{largo} characters."
	# 	elsif largo == 1
	# 		"This tweet has 1 character."
	# 	end
	# end

	def tweet_length (tweet)
		tlength = tweet.content.length
		return "This tweet has 1 character." if tlength == 1
		"This tweet has #{tlength} characters."
	end

	def user_handle (tweet)
		tweet.user.handle
	end	

	
end
