#Objective - giving each player a specific life points level. When level ==0 the player dies

class Player

  attr_accessor :name, :life_points
  #string, integer
 
  #we enter the basic information of player
  def initialize (name)
    @name = name
    @life_points = 10
  end

  #we want to know how much points the player has.
  def show_state
    show_state = @life_points
    if @life_points <= 0
      puts "> #{@name} have 0 life points. "
    else 
      puts "> #{@name} have #{@life_points} life points."
    end
  end 


  #we want to know how much points the player has after an attack.
  def gets_damage (damage) #the player can loose points with damages
    @life_points = @life_points - damage #we substract the damage received
    if @life_points > 0 #if substraction superior to 0 we display the number of points left
    puts "> #{@name} have #{@life_points} life_points. " 
    else @life_points <= 0  #else the player is dead
      puts "> #{@name} is dead. GAME OVER."
    end
  end


  #we create the attack between two players and state the number of points left to player 2 after player 1 attacked.
  def attacks(player)
    damage = compute_damage
    puts "> #{@name} attacks player #{player.name}"
    puts "> #{@name} inflicted #{damage} points to #{player.name}"
    player.gets_damage(damage)
  end

  #the attack inflicts a random number of points to the player2.
  def compute_damage
    return rand(1..6)
  end

 
end

class HumanPlayer < Player 

  attr_accessor :weapon_level #integer pour determiner le niveau de HUmanPLayer

  def initialize(name)
    super(name) #fait appel au initialize de la classe Player
    @life_points = 100 #Je modifie life_points
    @weapon_level = 1 # j'ai rajouté cette ligne
  end

  #The human state has one more specifity : it has a weapon.
  def show_state
    puts "#{@name} have #{@life_points} life points and a level weapon of #{@weapon_level}"
  end

  #The Human weapon can multiply damage.
  def compute_damage
    rand(1..6) * @weapon_level
  end

  #The weapon level, inflicting more damages, can change. If the level is higher you keep the gun, else you throw it'
  def search_weapon
    new_weapon = rand(1..6)
    puts ">You found a gun of the level #{new_weapon}"
    if new_weapon > @weapon_level 
      puts ">> Great!The weapon level is higher than my actual gun. I am going to kill them all "
       @weapon_level = new_weapon
    else
      puts ">> F@*#$...it is not better thant the previous one..."
    end
  end

  #HumanPlayer can also have health points - what cheaters! -
  def search_health_pack
     health_points = rand(1..6)
    if health_points == 1
      puts "You found nothing "
    elsif health_points >= 2 && health_points <= 5
      #if life_points < 50, add 50 if life_points>50 then total is 100.
      if @life_points < 50 
         @life_points += 50
      else 
        @life_points = 100
      puts "Lucky one, you have 50 points more! Here is your new life points #{life_points}"
      end
    elsif  health_points == 6
      puts " WaaooOw! You found a pack of 80 life points!" 
      if @life_points >= 20
         @life_points = 100
      else 
         @life_points += 80
      end
    end
  end
end
