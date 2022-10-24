#cette classe à été copier du site https://cbabhusal.wordpress.com/2015/10/02/ruby-printing-colored-formatted-character-in-ruby-colorize/
class String
  def black; "\e[30m#{self}\e[0m" end
  def red; "\e[31m#{self}\e[0m" end
  def green; "\e[32m#{self}\e[0m" end
  def brown; "\e[33m#{self}\e[0m" end
  def blue; "\e[34m#{self}\e[0m" end
  def magenta; "\e[35m#{self}\e[0m" end
  def cyan; "\e[36m#{self}\e[0m" end
  def gray; "\e[37m#{self}\e[0m" end
 
  def bg_black; "\e[40m#{self}\e[0m" end
  def bg_red; "\e[41m#{self}\e[0m" end
  def bg_green; "\e[42m#{self}\e[0m" end
  def bg_brown; "\e[43m#{self}\e[0m" end
  def bg_blue; "\e[44m#{self}\e[0m" end
  def bg_magenta; "\e[45m#{self}\e[0m" end
  def bg_cyan; "\e[46m#{self}\e[0m" end
  def bg_gray; "\e[47m#{self}\e[0m" end
 
  def bold; "\e[1m#{self}\e[22m" end
  def italic; "\e[3m#{self}\e[23m" end
  def underline; "\e[4m#{self}\e[24m" end
  def blink; "\e[5m#{self}\e[25m" end
  def reverse_color; "\e[7m#{self}\e[27m" end
end

#main

#Ici on demande le nombre de combinaison et on s'assure que l'utilisateur entre un nombre
def nbr_combinaison()
  loop do
    puts "Entrez un nombre de combinaison: ".magenta
    #nb_combi = gets.chomp.to_i
    nb_combi = Integer(gets) rescue false
    if nb_combi && nb_combi.between?(1,200)
      return nb_combi
     #if nb_combi = ~ /^-?[0-9]+$/
      #return nb_combi
    else
      puts "Vous devez entrer un chiffre".red
      puts "\n"
    end
  end
end

#nbr_combinaison()
nb_combi = nbr_combinaison()

#autre essai
#while nb_combi !=~ /^-?[0-9]+$/
  #puts "Entrez un nombre de combinaison "
  #nb_combi = gets.chomp
#end
#return nb_combi

#Fonction pour fabriquer les combinaison et on s'assure d'avoir aucun doublons
def generateur_combi(nb_combi)
  t = 0
  nombre_random = Random.new
  list_combi = Array.new
  nb_combi.times do |i|
   #nbr_cpmbi.each do |i|
   #for i in 0..nb_combi do
    list = Array.new
    #comme faire un for j in 0..7
    7.times do |j|
      #test boucles
      begin
        t = nombre_random.rand(1..49)
      end while list.index(t) != nil
      #loop do
        
        #break if list.index(t) != nil
      #end  
      #while list.index(t) != nil
    
      #end
      list.append(t)
    end
    list = list.sort
    #list = list.uniq
    list_combi.append(list)
  end
  return list_combi
end

generateur_combinaison = generateur_combi(nb_combi)

#Procedure pour afficher les combinaisons
def afficher_combinaison(list_combi)
  list_combi.each do |list_comb|
    list_comb.each do |liste|
      if liste < 10
        print "|0#{liste}|".green
      else
        print "|#{liste}|".green
      end
    end
    puts "\n"
  end
end

puts "\n"
puts "Vos combinaisons:".blue.bold.italic.underline
afficher_combinaison(generateur_combinaison)
gagnant = generateur_combi(1)
puts "\n"
puts "Combinaison gagnante:".bg_cyan.gray.bold.italic.underline
afficher_combinaison(gagnant)
puts "\n"

