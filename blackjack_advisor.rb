def ask_user
    print "What is your first card? "
    card1 = get_card
    card1 = card_value(card1)
    print "Great! What is your second card? "
    card2 = get_card
    card2 = card_value(card2)
    print "Ok. Now what is the dealer's upcard? "
    upcard = get_card
    upcard = card_value(upcard)
    return card1, card2, upcard

end

def get_card
    loop do
        card = gets.chomp
        return card if valid_card(card)
        print "Not a card. Try again: "
    end
end

def card_value(card)
    value = Integer(card) rescue nil
    if value != nil
        return value
    elsif card.upcase == 'A'
        return 'A'
    else
        return 10
    end
end

def valid_card(card)
    faces = ['J', 'Q', 'K', 'A']
    value = Integer(card) rescue nil
    if (value != nil) && (value>=2 && value<=10)
        return true
    elsif value == nil
        face = card.upcase
        if faces.include?(face)
            return true
        else
            return false
        end
    end
end

def welcome
    puts "Welcome. I am your Blackjack Advisor. Please tell me your first two" +
    "cards and the dealer's upcard."
    puts
    puts "Please enter values between 2 and 10. Jack, Queens, and Kings can be"+
    " typed as J, Q, and K, respectively. You may also simply type their value"+
    " of 10. An ace must be typed as an 'A'"
    puts
end

def main
    welcome
    card1, card2, upcard = ask_user
    puts "card1: " + card1.to_s
    puts "card2: " + card2.to_s
    puts "upcard: " + upcard.to_s
end

main
