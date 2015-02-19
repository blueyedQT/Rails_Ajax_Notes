class NotesController < ApplicationController
  def index
  	@notes = Note.all.reverse
  	@note = Note.new
  end

  def create
  	@note = Note.create(title:params[:note][:title], description:params[:note][:description])
  	if @note.save
  		@note_id = Note.select(:id).last
  		json_message = {action:"create", title:params[:note][:title], description:params[:note][:description], id:@note_id}
  		render json: json_message
  	end
  end

  def edit
  end

  def destroy
  	@note = Note.find(params[:id]).destroy
  	json_message = {action:"success"}
  	render json: json_message
  end
end
