class GameMailer < ApplicationMailer
  include PlayersHelper

  def notify_turn(game_id, player_id, your_id)
    @game_type = GameType.find(Game.find(game_id).game_type_id)
    puts ("!!!!!!!!! player_id=#{player_id}, your_id=#{your_id}")
    puts Player.all
    @player = Player.find(player_id)
    @opponent = Player.find(your_id)
    mail(to: @player.email, subject: "Now it's your turn!")
  end 

end
