require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message, background = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :background => background}
end

def check_guess(guess)
  if guess.zero?
    return ["Guess a number.", "#f2f2f2"]
  elsif guess <  (SECRET_NUMBER - 5)
    return ["Way too low!", "#e60000"]
  elsif guess > (SECRET_NUMBER + 5)
    return ["Way too high!", "#e60000"]
  elsif guess < SECRET_NUMBER
    return ["Too low!", "#ffcccc"]
  elsif guess > SECRET_NUMBER
    return ["Too high!", "#ffcccc"]
  else
    return ["You got it right! <br> The secret number was #{SECRET_NUMBER}.", "#00cc44"]
  end
end
