class GamesController < ApplicationController
  def index
  end

  def new
  end

  def create
    message = params[:message]
    Turbo::StreamsChannel.broadcast_replace_to 'message', target: 'new_message', partial: 'games/message', locals: { message: message }
    redirect_to new_game_path
  end
end
