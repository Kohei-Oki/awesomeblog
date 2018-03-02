class VotesController < ApplicationController

  def create
    micropost = Micropost.find(params[:micropost_id])
    votes = micropost.votes.build(user_id: current_user.id)
    if votes.save
      flash[:success] = "You voted this shit"
      redirect_to request.referrer || root_path
    end
    #current_user.upvote(params[:micropost_id])
  end

  def destroy
    #micropost = Micropost.find(params[:micropost_id])
    vote = Vote.find(params[:id])
    vote.destroy
    flash[:success] = "You don't like this shit"
    redirect_to request.referrer || root_path
  end

private
  def votes_param
      params.require(:vote).permit(:user_id)
  end
end
