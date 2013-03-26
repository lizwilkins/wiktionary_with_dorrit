class EntriesController < ApplicationController

  def create
    entry = Entry.new(params[:entry])
    if entry.save
      render :json => entry, :status => :created
    else
      render :json => entry.errors, :status => :unprocessable_entity
    end
  end

  def show
    entry = Entry.find(params[:id])
    render :json => entry
  end

  def update
    entry = Entry.find(params[:id])
    if entry.update_attributes(params[:entry])
      render :json => entry
    else
      render :json => entry.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    entry = Entry.find(params[:id])
    entry.destroy
    head :no_content
  end

  def index
    entries = Entry.all
    render :json => entries
  end
end

