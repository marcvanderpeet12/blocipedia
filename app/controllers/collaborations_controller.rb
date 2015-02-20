class CollaborationsController < ApplicationController
  
  def new 
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = @wiki.collaborations.new
    @users = User.all
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    #selected users
    @collaboration = @wiki.collaborations.build(user_id: params[:user_id])
    if @collaboration.save
      redirect_to wikis_path, notice: "Wiki shared."
    else
      flash[:error] = "Error creating wiki. Try again."
      render :new
  end
end

end