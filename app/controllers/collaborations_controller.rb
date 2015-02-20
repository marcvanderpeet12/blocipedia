class CollaborationsController < ApplicationController
  
  def new 
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = @wiki.collaborations.new
  end

end