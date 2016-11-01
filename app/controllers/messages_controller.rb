class MessagesController < ApplicationController

	def index
		load_room
		@messages = @room.messages
	end

	def create
		
		load_room
		@message = @room.messages.build(message_params)
		# @message.content = params[:content]
		# @message.username = params[:username]
		@message.save!
		redirect_to room_messages_path(@room)
	end

	def load_room
		@room = Room.find(params[:room_id])
	end
	private 

	def message_params
		params.require(:message).permit(:content,:username)
	end
end
