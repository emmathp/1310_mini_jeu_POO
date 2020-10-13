require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#premier combat
player1 = Player.new("Josiane")
player2 = Player.new("José")
puts "> To my right, #{player1.name} against, to my left #{player2.name}!"
puts "---------------------------------------------"

#tant que les players sont en vie on continue la boucle.
while player1.life_points > 0 && player2.life_points > 0

  puts "> Before the combat begins, here are their states" 
  puts"> #{player1.show_state}"
  puts"> #{player2.show_state}"
  puts"*********************************************"

  puts ">each player is ready to fight until death occurs...Let's start a round!"
  #si le player 1 est mort, il n'attaque plus
  puts">>#{player1.name} is attacking!"
  player1.attacks(player2)
  if player2.life_points <= 0 
    break #while  stop
  end 
  #si le player 2 est mort, il n'attaque plus
  puts">>#{player2.name} is fighting back!"
  player2.attacks(player1)
  if player1.life_points <= 0
    break #while  stop
  end
  puts "---------------------------------------------"
end


binding.pry

