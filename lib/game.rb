class Game
    def display_instructions
        system('clear')
        puts 'This is a tic-tac-toe game'
        puts 'Press the any key to start the game or q to quit the game'.colorize(:orange)
      end 
    
      def user_name
        print 'Enter the name of first player: '
        name1 = gets.chomp
        print 'Enter the name of second player: '
        name2 = gets.chomp
        puts "#{name1} will be using 'X' and #{name2} will be using 'O'"
        [name1, name2]
      end
    
      def get_user_input(current_player)
        print "#{current_player.name}, please pick your position:  " 
        gets.chomp 
      end   

end