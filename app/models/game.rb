require "json"
include GamesHelper

class Game < ActiveRecord::Base
  belongs_to :game_type
  belongs_to :player_1, :class_name => 'Player'
  belongs_to :player_2, :class_name => 'Player'

  def name
    game_obj.game_type_name
  end

  def game_obj
    if !@game_obj
      if game_data
        @game_obj = game_type.klass.json_create(JSON.parse(game_data))
      else
        @game_obj = game_type.create
      end
    end
    @game_obj
  end

  def board_html current_player
    player_no = 0
    if current_player
      if current_player.id == player_1_id
        player_no = 1
      elsif current_player.id == player_2_id
        player_no = 2
      end
    end

    game_obj.board_html id, player_no
  end

  def move params
    game_obj.move params
  end
  
  def moving_player
    if game_obj.moving_player == 1
      player_1
    elsif game_obj.moving_player == 2
      player_2
    else
      nil
    end
  end

  def winning_player
    if game_obj.winning_player == 1
      player_1
    elsif game_obj.winning_player == 2
      player_2
    else
      nil
    end
  end

  def whose_turn
    game_obj.moving_player
  end

  def game_started
    created_at
  end
    
  # a little hack to allow game creation in the game index page
  def default_game_type
    GameType.game_types.first
  end
  def default_player_1
    Player.first
  end
  def default_player_2
    Player.second
  end

  # notification
  after_save :notify_game_change

  def notify_game_change
    self.class.connection.execute "NOTIFY #{channel}, #{self.class.connection.quote self.to_s}"
  end

  def on_game_change
    self.class.connection.execute "LISTEN #{channel}"
    loop do
      self.class.connection.raw_connection.wait_for_notify do |event, pid, game|
        puts "!!!!!!!!! NOTFICATION %%%%%%%%%%"
        yield game
      end
    end
  ensure
    self.class.connection.execute "UNLISTEN #{channel}"
  end

  private
  def channel
    "games_#{id}"
  end

end
