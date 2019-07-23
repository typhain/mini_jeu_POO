require 'bundler'

class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
 end

 def show_state
   "#{@name} a #{@life_points} points de vie"
 end


 def gets_damage(damages)
 @life_points = @life_points - damages

   if @life_points <= 0
     p "le joueur #{@name} est zigouillé"
   end
 end

 def attacks(player)
  p "le joueur #{@name} attaque le joueur #{player.name}"
  damages_done = compute_damage
  player.gets_damage(damages_done)
  if player.life_points > 0
  p "le joueur #{@name} nique le #{player.name} en lui faisant perdre #{damages_done} point de vie"
  end
 end

 def compute_damage
   return rand(1..6)
 end
end


class HumanPlayer < Player
  attr_accessor :weapon_level

   def initialize(name)
     super(name)
     @life_points = 100
     @weapon_level = 1
   end

   def show_state
     "#{@name} a #{@life_points} points de vie et une arme de destruction massive #{weapon_level}"
   end

   def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    p "Tu as trouvé une arme de niveau #{new_weapon}."

      if new_weapon > 1
        p "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      else p "M@*#$... tu t'es fait bien bouillave, elle n'est pas mieux que ton arme actuelle..."
      end
  end

  def search_health_pack
    health_pack = rand(1..6)
    p health_pack

    if health_pack == 1
      p "t'as quedal"

    elsif health_pack> 1 && health_pack < 6
      p  "Bravo, tu as trouvé un pack de +50 points de vie !"
      if @life_points < 50
        p "tu as #{@life_points + 50} points de vie."
      else
        p "tu as #{@life_points + 50 - (@life_points - 50)} points de vie"
      end

    else
      p "Bravo, tu as trouvé un pack de +80 points de vie !"
      if @life_points < 20
        p "tu as #{@life_points + 80} points de vie."
      else
        p "tu as #{@life_points + 80 + (@life_points - 80) - 100}."
      end
    end

  end
end
