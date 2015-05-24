class GamesController < ApplicationController
  before_action :set_game

  # GET /games/1
  def show
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_game
    id = params[:id]
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