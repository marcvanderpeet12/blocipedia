class CollaborationsController < ApplicationController
  
  def new 
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = @wiki.collaborations.new
    @users = User.where.not(id: current_user.id).where.not(id: @wiki.users.map(&:id))
    #Users zijn niet mezelf!
    #users zijn geen @wiki.users
    #refactor this
    #define it as scope in wiki model
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    #selected users
    # @collaboration = @wiki.collaborations.build(user_id: params[:user_ids])
    params[:user_ids].each { |uid| @wiki.collaborations.build(user_id: uid) }

    if @wiki.save
      redirect_to wikis_path, notice: "You created a collaboration."
    else
      flash[:error] = "Error creating wiki. Try again."
      render :new
  end
end

def destroy
    @collaboration = Collaboration.find(params[:id])  
    @wiki = @collaboration.wiki

    if @collaboration.destroy
      redirect_to wiki_path(@wiki), notice: "collaboration deleted."
    else
      flash[:error] = "Error creating wiki. Try again."
      render :new
  end
end


end