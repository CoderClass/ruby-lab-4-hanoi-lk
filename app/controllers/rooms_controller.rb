class RoomsController < ApplicationController
  def index
    @rooms = Room.all

		respond_to do |format|
			format.html
			# format.json {render json: @messages}
			# format.js
		end
  end

  def create
    @room = Room.new room_params
    if @room.save
      flash.now[:success] = 'Room created'
      redirect_to root_path
    else
      flash[:error] = 'Created room failed'
      redirect_to root_path
    end
  end


	def show
		@room = Room.find(params[:id])
		redirect_to room_messages_path(@room)
	end




  private

  def room_params
    params.require(:room).permit(:name)
  end

end
