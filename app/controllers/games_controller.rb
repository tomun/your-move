class GamesController < ApplicationController
  include SessionsHelper
  include ActionController::Live

  before_action :set_game

  # GET /games/new
  def new
    @game = Game.new
  end

  # POST /games
  def create
    @game = Game.new(game_params)
    respond_to do |format|
      if @game.save
        format.html { redirect_to games_path, notice: 'Game was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
    end
  end

  # GET /games
  def index
    @games = Game.all
  end

  # GET /games/1
  def show

  end

  # GET /games/1/move
  def move
    @game.move params
    @game.game_data = @game.game_obj.to_json

    if @game.save 
      if signed_in? && @game.whose_turn > 0
        GameMailer.notify_turn(@game.id, @game.whose_turn, current_player).deliver_now
      end
      render "show"
    end

  end

  # Server Side Event
  def sse_index
    response.headers['Content-Type'] = 'text/event-stream'
    @game.on_game_change do |game|
      response.stream.write(sse({game: game}, {event: 'refresh'}))
    end
  rescue IOError
    # Client Disconnected
  ensure
    response.stream.close
  end

private
  def sse(object, options = {})
    (options.map{|k,v| "#{k}: #{v}" } << "data: #{JSON.dump object}").join("\n") + "\n\n"
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    id = params[:id]
    if id == nil
      id = params[:game_id]
    end
    if id != nil 
      @game = Game.find(id)
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def game_params
    params.require(:game).permit(
      :game_type_id,
      :player_1_id,
      :player_2_id,
      :game_started,
      :game_ended,
      :game_data)
  end  

end
