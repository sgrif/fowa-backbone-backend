class NotesController < ApplicationController
  respond_to :json

  def index
    respond_with notes
  end

  def create
    note = notes.create(note_params)
    respond_with note, location: note_url(note, username: username)
  end

  def update
    note.update_attributes(note_params)
    respond_with note do |format|
      format.json { render json: note }
    end
  end

  def destroy
    note.destroy
    respond_with note
  end

  private

  def username
    params[:username]
  end

  def note_params
    params.permit(:title, :content)
  end

  def user
    @_user ||= User.where(name: params[:username]).first_or_create!
  end

  def notes
    @_notes ||= user.notes.order(:id)
  end

  def note
    @_note ||= notes.find(params[:id])
  end
end
