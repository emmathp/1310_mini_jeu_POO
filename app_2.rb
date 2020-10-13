require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "
------------------------------------------------
|Welcome in the superfighting game !      |
|Normally, in such game you should try to survive and be the last one standing, 
but here I think it could be an exploit to die|
| ARE YOU GONE LIVE IN A SUBURB OR GO INTO THE JUNGLE AND FIGHT?
-------------------------------------------------"

puts ""
puts "What is your warrior name, little human cheater?" 
user_name = gets.chomp
user = HumanPlayer.new(user_name)

puts "Welcome in the game #{user_name}, you are a fool to play with machine..."
puts ""
puts "If you think we will let you destroy us, super machine, you are a dreamer human! Let's meet two of our weak machine players..."

enemies = Array.new
player1 = Player.new("Josiane") 
player2 = Player.new("José") 
enemies.append(player1, player2)
puts "... #{player1.name} and #{player2.name}! Are you afraid? You can still quit."

puts "Your enemies are ready to destroy you. Are you ready to fight back? Let's discover and begin"

#tant que le player est en vie et qye kes enemies sont superieurs a 0 on continue la boucle.
while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
  #on explique les possibilites du menu
  puts"*********************************************"
  puts "> Before the combat begins, here are are your strategic board" 
  puts user.show_state
  puts ">> You can decide to do three actions :
  >>> enter 'a'- get a new weapon
  >>> enter 's' - get life points
  You also can decide to attack one of the player:
  >>> enter 0 - You will attack #{player1.name} who has #{player1.life_points} life points
  >>> enter 1- You will attack #{player2.name} who has #{player2.life_points} life points"

  puts"What do you want to do ?" 
  action = gets.chomp.to_s
  puts"*********************************************"
  #on attribue des actions aux choix des menus
  if action == "a" 
     user.search_weapon
    elsif  action == "s" 
      user.search_health_pack
    elsif action == "0" 
      user.attacks(player1)
    elsif action == "1"
      user.attacks(player2)
    else
      puts "OOoops. This command do not exist, try again"
      main_menu
  end
  #les enemies attaques tant qu'ils ont une vie superieure a 0
  enemies.each do |x|
    if x.life_points > 0
      x.attacks(user)
      puts "Next round?"
    end
  end
end
 #On sort de la boucle des que les deux enemis ou le user est mort et on determine qui gagne.
if user.life_points <= 0
  puts " YOU LOOSE, LOOSER"
else
  puts " ------------------------------------------------
  |YOU WON|
  ---------------------------------------------"
end

binding.pry
