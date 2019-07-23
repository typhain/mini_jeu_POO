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
  p "le joueur #{@name} nique le #{player.name} en lui faisant perdre #{damages_done} point de vie"
 end

 def compute_damage
   return rand(1..6)
 end
end
