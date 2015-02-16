class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
   @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @user = current_user
    if @wiki.save
      @user.wikis << @wiki
      flash[:notice] = "You successfully created a wiki!"
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id]) 
    if @wiki.destroy  
     flash[:error] = "Your todo was deleted!"
     redirect_to wikis_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end

  private
 
   def wiki_params
     params.require(:wiki).permit(:title, :body)
   end

end
