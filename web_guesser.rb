require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  background = background_color(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :background => background}
end

def check_guess(guess)
  difference = (SECRET_NUMBER - guess).abs
  if guess < SECRET_NUMBER
    difference > 5 ? "Way too low!" : "Too low!"
  elsif guess > SECRET_NUMBER
    difference > 5 ? "Way too high!" : "Too high!"
  else
    "You got it right! <br> The Secret Number was #{SECRET_NUMBER}!"
  end
end

def color(message)
  case message
    when "Way too low!" || "Way too high!"
      'red'
    when "Too low!" || "Too high!"
      '#FCDFDC'
    when "You got it right!"
      'green'
  end
end
