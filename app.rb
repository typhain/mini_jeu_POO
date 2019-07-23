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
while player2.life_points >=0 || player1.life_points >=0
puts "Passons à la phase d'attaque :"
p player2.attacks(player1)
p player1.attacks(player2)
end 
