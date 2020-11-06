class Game
  def display_banner
    system('clear')
    puts "

    ████████╗██╗░█████╗░░░░░░░████████╗░█████╗░░█████╗░░░░░░░████████╗░█████╗░███████╗
    ╚══██╔══╝██║██╔══██╗░░░░░░╚══██╔══╝██╔══██╗██╔══██╗░░░░░░╚══██╔══╝██╔══██╗██╔════╝
    ░░░██║░░░██║██║░░╚═╝█████╗░░░██║░░░███████║██║░░╚═╝█████╗░░░██║░░░██║░░██║█████╗░░
    ░░░██║░░░██║██║░░██╗╚════╝░░░██║░░░██╔══██║██║░░██╗╚════╝░░░██║░░░██║░░██║██╔══╝░░
    ░░░██║░░░██║╚█████╔╝░░░░░░░░░██║░░░██║░░██║╚█████╔╝░░░░░░░░░██║░░░╚█████╔╝███████╗
    ░░░╚═╝░░░╚═╝░╚════╝░░░░░░░░░░╚═╝░░░╚═╝░░╚═╝░╚════╝░░░░░░░░░░╚═╝░░░░╚════╝░╚══════╝
        ".colorize(:red)
  end

  def display_instructions
    puts 'Press the any key to start the game or q to quit the game'.colorize(:cyan)
  end

  def valid_name?(name)
    while name.strip == ''
      print "Name can't be blank, please enter the name again: "
      name = gets.chomp
    end
    name
  end

  def user_name
    print 'Enter the name of first player: '.colorize(:red)
    name1 = valid_name?(gets.chomp)
    print 'Enter the name of second player: '.colorize(:blue)
    name2 = valid_name?(gets.chomp)
    puts "#{name1} will be using 'X' and #{name2} will be using 'O'"
    [name1.upcase, name2.upcase]
  end

  def get_user_input(current_player)
    print "\n #{current_player.name}, please pick your position:  "
    gets.chomp
  end

  def validate_input(board, position)
    until board.valid_move?(position)
      puts 'InputError: Please enter select the cell between 1 and 9: ' unless position.to_i.between?(1, 9)
      puts 'InputError: Please select cell that is not taken (refer to cell labels)' if board.position_taken?(position)
      print 'Please enter the value again: '
      position = gets.chomp
    end
    position
  end

  def display_detail(player_a, player_b)
    system('clear')
    display_banner
    puts "Player 1: #{player_a.name} | Player 2: #{player_b.name}"
  end

  def an_outcome?(board, player_a, player_b, current_player)
    display_detail(player_a, player_b)
    board.draw
    if board.win?
      puts "\n#{current_player.name} is the WINNER!!!!".colorize(:yellow)
      true
    elsif board.tied?
      puts '\n Looks like it is a Tie!!'.colorize(:green)
      true
    end
  end

  def play(board, current_player, player_a, player_b)
    loop do
      display_detail(player_a, player_b)
      board.draw
      position = get_user_input(current_player)
      validated_position = validate_input(board, position)
      board.update(validated_position, current_player)
      system('clear')
      break if an_outcome?(board, player_a, player_b, current_player)

      current_player = board.switch_player(player_a, player_b, current_player)
    end
  end
end
