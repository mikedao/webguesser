require 'sinatra'
require 'sinatra/reloader'

	secret_number = rand(101)

get '/' do
	user_guess 	= params["guess"].to_i
	message 		= ""
	message 		= feedback(user_guess, secret_number) if user_guess != 0

	erb :index, locals: { :secret_number 	=> secret_number,
												:message 				=> message
											}
end


def feedback(user_guess, secret_number)
	if user_guess > secret_number
		if user_guess - secret_number > 10
			"Way too high."
		else
			"Too high."
		end
	elsif user_guess < secret_number
		if secret_number - user_guess > 10
			"Way too low."
		else
			"Too low."
		end
	else
		"Correct! The secret number is #{secret_number}"
	end
end
