class NotesController < ApplicationController
  def index
  	@notes = Note.all
  	@note = Note.new
  end

  def create
  	@note = Note.create(title:params[:note][:title], description:params[:note][:description])
  	if @note.save
  		json_message = {title:params[:note][:title], description:params[:note][:description]}
  		render json: json_message
  	end

  end
end
