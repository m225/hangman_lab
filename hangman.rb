
# METHOD - CHECK LETTER
def check_letter(word, letters)
  if word.include?(letters) == false
    puts "Your guess is incorrect."
  else
    letters = word.split('')
    letterlocation = []
    # go through each letter in letters (the word)
    letters.each do |letter, index|
      if letter == letters
        index = letters.index(letter)
        letterlocation.push index
      end
    end
  end
end

# METHOD - DISPLAY RESULT
def display_result(word, letters_guessed)
  word = word.split("")
  outputs = []
  word.each do |letter|
    if letters_guessed.include?(letter) == false
      outputs.push " _ "
    elsif letters_guessed.include?(letter) == true
      outputs.push letter + " "
    end
  end
  puts outputs.join("")
end

# when the user has had 0 wrong
def draw_man(num_wrong)
  if num_wrong == 0
    puts " ___________________________________"
    puts "|                  |                |"
    puts "|                  |                |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|___________________________________|"
    puts " You have 7 lives left!"

    # if the user gets 1 wrong (add a head to the person)
  elsif num_wrong == 1
    puts " ___________________________________"
    puts "|                  |                |"
    puts "|                  |                |"
    puts "|                (0.0)              |"
    puts "|                  -                |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|___________________________________|"
    puts "You have 6 lives left!"

# if the user gets two wrong (add a body to the person)
  elsif num_wrong == 2
    puts " ___________________________________"
    puts "|                  |                |"
    puts "|                  |                |"
    puts "|                (0.0)              |"
    puts "|                  -                |"
    puts "|                  |                |"
    puts "|                  |                |"
    puts "|                  |                |"
    puts "|                  |                |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|___________________________________|"
    puts "You have 5 lives left!"
# if the user gets three wrong (add one arm to the person)
  elsif num_wrong == 3
    puts " ___________________________________"
    puts "|                  |                |"
    puts "|                  |                |"
    puts "|                (0.0)              |"
    puts "|                  -                |"
    puts "|                \\ |                |"
    puts "|                 \\|                |"
    puts "|                  |                |"
    puts "|                  |                |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|___________________________________|"
    puts "You have 4 lives left!"

# if the user gets four wrong (add the other arm to the person)
  elsif num_wrong == 4
    puts " ___________________________________"
    puts "|                  |                |"
    puts "|                  |                |"
    puts "|                (0.0)              |"
    puts "|                  -                |"
    puts "|                \\ | /              |"
    puts "|                 \\|/               |"
    puts "|                  |                |"
    puts "|                  |                |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|                                   |"
    puts "|___________________________________|"
    puts "You have 3 lives left!"
# if the user gets five wrong (add a leg to the person)
  elsif num_wrong == 5
    puts " ___________________________________"
    puts "|                  |                |"
    puts "|                  |                |"
    puts "|                (0.0)              |"
    puts "|                  -                |"
    puts "|                \\ | /              |"
    puts "|                 \\|/               |"
    puts "|                  |                |"
    puts "|                  |                |"
    puts "|                 /                 |"
    puts "|                /                  |"
    puts "|               /                   |"
    puts "|                                   |"
    puts "|___________________________________|"
    puts "You have 2 lives left!"

# if the user gets six wrong (add a second leg to the person, and the game is over)
  elsif num_wrong == 6
    puts " ___________________________________"
    puts "|                  |                |"
    puts "|                  |                |"
    puts "|                (0.0)              |"
    puts "|                  ~                |"
    puts "|                \\ | /              |"
    puts "|                 \\|/               |"
    puts "|                  |                |"
    puts "|                  |                |"
    puts "|                 / \\               |"
    puts "|                /   \\              |"
    puts "|               /     \\             |"
    puts "|                                   |"
    puts "|___________________________________|"
    puts "You have 1 life left!"
  elsif num_wrong ==7
    puts "You have no lives left!"
    puts "Thanks for playing!"
  end
end

word_file = File.new("hangman_words.dat", "r")
words = word_file.readlines
word = words.sample.chomp
word_file.close

puts "This is a Hangman Game!!!"
puts "The object of the game is to guess the letters in the word correctly to form the word."
puts "You have 6 lives- once you get 6 wrong, you lose."
puts "When you are ready, hit enter to start."
puts "If you want to quit, then type 'quit'"

num_wrong = 0
letter_guess = ''

while letter_guess != "quit"
  puts "Guess?"
  letter_guess = gets.chomp

  puts "WORD:"
  letters_guessed = []
  letters_guessed.push letter_guess

  display_result(word, letters_guessed)

  if !word.include?(letter_guess)
    num_wrong += 1 unless num_wrong == 7
    draw_man(num_wrong)
    end
end

  if num_wrong == 7
    draw_man(7)
    puts "GAME OVER! The word was '#{word}"
    exit
  end

while letter_guess != word && word.include?(letter_guess) == false
  puts "Your guess is incorrect."
end
