class CollaborationsController < ApplicationController
  
  def new 
    @collaboration = Collaboration.new
  end

end