require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  return "Take a guess!" if guess == nil
  return "Too high!" if guess > SECRET_NUMBER
  return "WAY too high!" if guess > SECRET_NUMBER + 5
  return "WAY too low!" if guess < SECRET_NUMBER - 5
  return "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}." if guess == SECRET_NUMBER
end
