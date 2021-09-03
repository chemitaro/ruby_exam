class Player
  def hand
    while true
      puts "数字を入力してください。"
      puts "0:グー, 1:チョキ, 2:パー"
      input_hand = gets.chomp
      puts input_hand
      if ["0","1","2"].include?(input_hand)
        return input_hand.to_i
      end
    end
  end
end
class Enemy
  def hand
    return rand(max=3)
  end
end
class Janken
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    puts "相手の手は#{janken[enemy_hand]}です。"
    if player_hand == enemy_hand
      puts "あいこ"
      return true
    elsif (player_hand - enemy_hand + 3)%3 == 2
      puts "あなたの勝ちです"
      return false
    else
      puts "あなたの負けです"
      return false
    end
  end
end
class GameStart
  def self.jankenpon
    player = Player.new
    enemy = Enemy.new
    janken = Janken.new
    next_game = true
    while next_game
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end
GameStart.jankenpon
