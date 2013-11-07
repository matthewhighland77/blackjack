require 'pry'

def calculate_total(cards)
  arr = cards.map{|e| e[1] }

  total = 0
  arr.each do |value|
    if value == "Ace"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  #correct for aces
  arr.select{|e| e == "Aces"}.count.times do
    total -= 10 if total > 21
  end

  total
end

# game starts here


puts "Welcome to Black Jack"

deck_array_suits = ['Clubs', 'Diamonds', 'Spades', 'Hearts']
deck_array_numbers = [ 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9, 10 , 'Jack', 'Queen', 'King', 'Ace']
deck = []
deck = deck_array_suits.product(deck_array_numbers)
deck.shuffle!

#deal cards

my_cards = []
dealer_cards = []

my_cards << deck.pop
dealer_cards << deck.pop
my_cards << deck.pop
dealer_cards << deck.pop

my_total_cards = calculate_total(my_cards)
dealer_total_cards = calculate_total(dealer_cards)

#show cards

puts  "Your first card is #{my_cards[0]}, 
	and your second card is #{my_cards[1]}, for a total of #{my_total_cards}"

puts  "The dealer is showing a #{dealer_cards[1]}"

if my_total_cards == 21
  puts "Congratulations, you hit blackjack on the deal! You Win!"
  exit
end

if dealer_total_cards == 21
  puts "Sorry, the dealer hit blackjack on the deal, you lose!"
  exits
end

while my_total_cards < 21
  puts  "Would you like to 'Hit' or 'Stay'?"
  player_hit_or_stay = gets.chomp.capitalize
  if !['Hit', 'Stay'] .include?(player_hit_or_stay)
    puts "Please type 'Hit' or 'Stay'"
    next
  end
  if player_hit_or_stay == 'Stay'
    puts "You chose to stay, good luck, I hope you have a good hand!"
    break
  end
  if player_hit_or_stay == 'Hit'
    new_card = deck.pop
    puts "Dealing new card to player"
    puts "New card is #{new_card}"
    my_cards << new_card
    my_total_cards = calculate_total(my_cards)
    puts "Your new total is #{my_total_cards}"
  end
 end

 if my_total_cards > 21
    puts "Sorry, you busted! The dealer wins!"
    exit
  end

puts "Now the dealer will show his hand."
puts "Dealer uncovers his facedown card to reveal a #{dealer_cards[0]} ."
puts "Remember, the dealer must stay on 16 and hit on anything lower"

while dealer_total_cards < 17
  new_card = deck.pop
  puts "Dealer is receiving a new card, and it is a #{new_card}"
  dealer_cards << new_card
  dealer_total_cards = calculate_total(dealer_cards)
  puts "Dealer new total is #{dealer_total_cards} ."
  if dealer_total_cards > 21
    puts "Dealer Busted, you win!" 
    exit
  end
  if dealer_total_cards > my_total_cards
    puts "Sorry, the dealer wins!"
  else
    puts "Congratulations, you played a tough game and came out the winner!  Bottoms up!"
  end
 end

if dealer_total_cards >= 17
  puts "Dealer is staying with a total of #{dealer_total_cards}"
  if dealer_total_cards > my_total_cards
    puts "Sorry, the dealer wins!"
  else
    puts "Congratulations, you played a tough game and came out the winner!  Bottoms up!"
  end
end












       
