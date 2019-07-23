require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

p "Voici l'état de chaque joueur :"
p player1.show_state
p player2.show_state
while player1.life_points >0 || player2.life_points >0
puts "Passons à la phase d'attaque :"
player1.attacks(player2)
break if player2.life_points <= 0
player2.attacks(player1)
end
