class CommentsController < ApplicationController

  def index
    @comments = Comment.find :all, :order => "id DESC"
    render :layout => "bootstrap"
  end

  def delete
    @comment = Comment.find(params[:id])
    if @comment.can_delete(current_user) || params[:password].to_i == APP_CONFIG["password"]
      @comment.destroy
    end
    redirect_to "/spectra/show/"+@comment.spectrum_id.to_s if params[:index] != "true"
    redirect_to "/comments" if params[:index] == "true"
  end

end
