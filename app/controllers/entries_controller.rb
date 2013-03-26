class EntriesController < ApplicationController

  # it {should route(:post, '/entries').to :action => :create}
  def create
    entry = Entry.new(params[:entry])
    if entry.save
      render :json => entry, :status => :created
    else
      render :json => entry.errors, :status => :unprocessable_entity
    end
  end

  # it {should route(:get, '/entries/1').to :action => :show, :id => 1}
  def show
    entry = Entry.find(params[:id])
    render :json => entry
  end


 # it {should route(:put, '/entries/1').to :action => :update, :id => 1}
  # def update
  #   entry = Entry.find(params[:id])

  #   if entry.update_attributes(params[:entry])
  #     render :json => entry
  #   else
  #     render :json => entry.errors, :status => :unprocessable_entity
  #   end
  # end

 # # it {should route(:delete, '/entries/1').to :action => :destroy, :id => 1}
 #  def destroy
 #    entry = Entry.find(params[:id])
 #    entry.destroy
 #    head :no_content
 #  end

 # it {should route(:get, '/entries').to :action => :index}
  def index
    entries = Entry.all
    render :json => entries
  end
end

