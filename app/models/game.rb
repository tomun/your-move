require "json"
include GamesHelper

class Game < ActiveRecord::Base
  belongs_to :game_type
  belongs_to :player_1, :class_name => 'Player'
  belongs_to :player_2, :class_name => 'Player'

  after_save :notify_game_change

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
  
  def game_over?
    game_obj.game_over?
  end

  def waiting_for_turn? current_player
    if game_over?
      false
    else
      !(moving_player == current_player)
    end
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

  # notifications

  # called by Rails when the record is saved
  def notify_game_change
    connection.execute "NOTIFY #{channel}, #{connection.quote self.to_s}"
  end

  def on_game_change
    connection.execute "LISTEN #{channel}"
    # loop do
      connection.raw_connection.wait_for_notify do |event, pid, game|
        yield game
      end
    # end
  ensure
    connection.execute "UNLISTEN #{channel}"
  end

private
  def connection
    self.class.connection
  end

  def channel
    "games_#{id}"
  end

end
