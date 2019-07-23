require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

p "----------------------------------------------------------------------------------"
p "Prêt à affronter les enfers ? ça va être la saignée, ils veulent tous te trucider.|"
p "Le but du jeu et de tous les niquer et d'être le dernier survivant de la tuerie   |"
p "----------------------------------------------------------------------------------"
player1 = Player.new("Josiane")
player2 = Player.new("José")
ennemies = [player1, player2]
p "Balance ton prénom petit agneau"
name = gets.chomp
player3= HumanPlayer.new(name)

p "Voici l'état de chaque joueur :"
p player1.show_state
p player2.show_state
p player3.show_state

  while player3.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)

    print "Tu as plusieurs options :

    a - chercher une meilleure arme
    s - chercher à se soigner\n\n"

    p "attaquer un joueur en vue :"
    p "0 - #{player1.show_state}"
    p "1 - #{player2.show_state}"

    prompt = TTY::Prompt.new
    prompt.select("Quelle action veux-tu effectuer ?", %w(a s 0 1))


    puts "Passons enfin à l'action :"
      if prompt= a
      player3.search_weapon
      elsif prompt = s
      player3.search_health_pack
      elsif prompt = 0
      player3.attacks(player1)
      elsif prompt = 1
      player3.attacks(player2)
    end
  end

p "La partie est finie."
  if player3.life_points > 0
  "BRAVO petit agneau ! TU AS GAGNE, tu as survécu !"
  else
    p "Loser, tu t'es fait avoir comme une merde ! Tu as perdu !"
  end
binding pry
