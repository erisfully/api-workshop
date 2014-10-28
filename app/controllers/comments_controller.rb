class CommentsController < ApplicationController

  def index
    @comments = Comment.all(params[:project_id], params[:story_id])
  end

end