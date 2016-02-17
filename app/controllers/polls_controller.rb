class PollsController < ApplicationController
  unloadable
  
  before_filter :find_project, :authorize, :only => :index

  def index
  	@polls = Poll.all
  end

  def vote
  	if cookies[:vote]
  		flash[:notice] = "You already vote."
  		redirect_to :action => 'index'
  	else	
	  	poll = Poll.find(params[:id])
	  	poll.vote(params[:answer])
	  	if poll.save
	  		flash[:notice] = 'Vote saved.'
	  		cookies[:vote] = true
	  	end	
	  	redirect_to :action => 'index'
	end 	
  end
  
  private 

  def find_project
    @project = Project.find(params[:project_id])
  end
end
