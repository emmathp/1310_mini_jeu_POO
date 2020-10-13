#We are coding the game with attacks, fights.
class Game

  attr_accessor :human_player, :enemies

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @enemies = Array.new 
    4.times do |player| 
      player = Player.new("enemy#{player}") 
      enemies.append(player)
    end
  end 


#ette méthode permettra d'éliminer un adversaire tué.Pour le moment il permet de supprimer une entree.
  def kill_player(player)
    @enemies.each do |x|
     if player == x.name
        @enemies.delete(x)
     end
  end 

  # retourne true si le jeu est toujours en cours et false sinon. Le jeu continue tant que le @human_player a encore des points de vie et qu'il reste des Player à combattre dans l’array @enemies.
  def is_still_ongoing?
    if @human_player.life_points > 0 && @enemies.length > 0
      return true
    else 
      return false
    end
  end

  #affiche 1) l'état du joueur humain et 2) le nombre de joueurs "bots" restant
  def show_players
    @human_player.show_state
    puts "Here is the number of enemies still in the game: #{enemies.length} "
  end

  def menu
    puts ">> You can decide to do three actions :
      >>> enter 'a'- get a new weapon
      >>> enter 's' - get life points
      You also can decide to attack one of the player:"
      @enemies.each do |player|
        if @enemies.life_points > 0  
             
  end
end


