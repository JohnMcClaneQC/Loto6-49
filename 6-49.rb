#Programme 6-49

#main

#Boucle pour recommencer le programme
begin

  #pour clear le terminal
  print "\033[2J\033[H"

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



  #Ici on demande le nombre de combinaison et on s'assure que l'utilisateur entre un nombre
  def nbr_combinaison()
    loop do
      puts "Entrez un nombre de combinaison: ".magenta
      nb_combi = Integer(gets) rescue false
      if nb_combi && nb_combi.between?(1,200)
        return nb_combi
      else
        puts "Vous devez entrer un chiffre".red
        puts "\n"
      end
    end
  end

  nb_combi = nbr_combinaison()



  #Fonction pour fabriquer les combinaison et on s'assure d'avoir aucun doublons
  def generateur_combi(nb_combi)
    t = 0
    nombre_random = Random.new
    list_combi = Array.new

    nb_combi.times do |i|

      list = Array.new
      #comme faire un for j in 0..7
      7.times do |j|
        #ici utilisé cette boucle car il fallait j'entre au moins une fois
        begin
          t = nombre_random.rand(1..49)
        end while list.index(t) != nil
        #boucle que j'ai essayé
        #loop do
        
          #break if list.index(t) != nil
        #end  
        #while list.index(t) != nil
    
        #end
        list.append(t)
      end
      list = list.sort

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

  #Fonction pour calculer les statistiques pour les combinaisons gagnantes
  def calculer_gagnant(gagnant, list_combi)
    list_gagnants = Array.new
    19.times do |k|
      list_gagnants.append(0)
    end
    list_gagnants[18] = list_combi.count
    
    list_combi.each do |j|

      match = 0
      bonus = false
      gagnant_Prix = 0
      perdant_Prix = 0
      #pour savoir si les chiffre se retrouve dans la liste 
      for i in 0..gagnant[0].count - 1 do
        for h in 0..gagnant[0].count - 1 do
          if gagnant[0][i] == j[h]
            if i == gagnant[0].count - 1
              list_gagnants[i] += 1
              bonus = true
            else 
              list_gagnants[i] += 1
              match += 1
            end  
          end 
        end
      end
      #ici j'incrémente de 1 le nouveau tableau à la position indiqué
      if match == 0
        list_gagnants[7] += 1
        perdant_Prix += 1
      elsif match == 1
        list_gagnants[8] += 1
        perdant_Prix += 1  
      elsif match == 2
        if bonus
          list_gagnants[9] += 1
          gagnant_Prix += 1
        else
          list_gagnants[10] += 1
          gagnant_Prix +=1 
        end 
      elsif match == 3
        if bonus 
          list_gagnants[11] += 1
          gagnant_Prix +=1
        else
          list_gagnants[12] += 1
          gagnant_Prix +=1  
        end
      elsif match == 4
        if bonus 
          list_gagnants[13] += 1
          gagnant_Prix +=1
        else
          list_gagnants[14] += 1
          gagnant_Prix +=1  
        end  
      elsif match == 5
        if bonus 
          list_gagnants[15] += 1
          gagnant_Prix +=1
        else
          list_gagnants[16] += 1
          gagnant_Prix +=1  
        end 
      elsif match == 6
        list_gagnants[17] += 1
        gagnant_Prix +=1  
      end  
    end 
    return list_gagnants
  end

  

  liste_Gagnants = calculer_gagnant(gagnant, generateur_combinaison)
  

  #Procedure pour afficher les statistiques
  def afficher_resultat(liste_Gagnants)
    puts "Les statistiques: ".blue.bold.italic.underline
    puts "Le premier nombre est sortit : #{liste_Gagnants[0]} ".bg_brown
    puts "Le deuxième nombre est sortit : #{liste_Gagnants[1]} ".bg_brown
    puts "Le troisième nombre est sortit : #{liste_Gagnants[2]} ".bg_brown
    puts "Le quatrième nombre est sortit : #{liste_Gagnants[3]} ".bg_brown
    puts "Le cinquième nombre est sortit : #{liste_Gagnants[4]} ".bg_brown
    puts "Le sixième nombre est sortit : #{liste_Gagnants[5]} ".bg_brown
    puts "Le complémentaire est sortit : #{liste_Gagnants[6]} ".bg_brown
    puts "\n"
    puts "Les Gagnants: ".blue.bold.italic.underline
    puts "Combinaison avec 0/6 : #{liste_Gagnants[7]} ".bg_brown
    puts "Combinaison avec 1/6 : #{liste_Gagnants[8]} ".bg_brown
    puts "Combinaison avec 2/6 : #{liste_Gagnants[9]} ".bg_brown
    puts "Combinaison avec 2/6 + comp : #{liste_Gagnants[10]} ".bg_brown
    puts "Combinaison avec 3/6 : #{liste_Gagnants[11]} ".bg_brown
    puts "Combinaison avec 3/6 + comp : #{liste_Gagnants[12]} ".bg_brown
    puts "Combinaison avec 4/6 : #{liste_Gagnants[13]} ".bg_brown
    puts "Combinaison avec 4/6 + comp : #{liste_Gagnants[14]} ".bg_brown
    puts "Combinaison avec 5/6 : #{liste_Gagnants[15]} ".bg_brown
    puts "Combinaison avec 5/6 + comp : #{liste_Gagnants[16]} ".bg_brown
    puts "Combinaison avec 6/6 : #{liste_Gagnants[17]} ".bg_brown
  end 


  afficher_resultat(liste_Gagnants)
  puts "\n"


  #Methode pour recommencer le programme
  def recommencer()
    loop do
      puts "Voulez-vous refaire un tirage (O/N) ? ".red
      rep = gets.chomp.to_s
      rep = rep.upcase
      if rep && (rep == "O" || rep == "N")
        return rep
      end 
    end  
  end 

  reponse = recommencer()

end while reponse == 'O'


