module LoginsHelper

def signed_in?
	 	!session[:user_id].nil?
end

end
