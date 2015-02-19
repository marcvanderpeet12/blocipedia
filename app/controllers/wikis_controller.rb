class WikisController < ApplicationController
  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
    @users = User.all
  end

  def new
   @wiki = Wiki.new
   @users = User.all
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @user = current_user
    authorize @wiki
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

  def edit
    @wiki = Wiki.find(params[:id])
    @users = User.all
  end

  def update
     @wiki = Wiki.find(params[:id])
     if @wiki.update_attributes(wiki_params)
       redirect_to @wiki
     else
       flash[:error] = "Error saving this wiki. Please try again"
       render :edit
     end
  end

  private
 
   def wiki_params
     params.require(:wiki).permit(:title, :body)
   end

end
