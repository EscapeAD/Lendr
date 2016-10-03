class StoriesController < ApplicationController

  def update
    @story = Story.find(params[:id])
    @story.update_attributes(story_params)
    @story.save
    @story.update_attributes(completed: true, datetime: Date.now)
    @story.save
    redirect_to user_path
  end

  private
  def story_params
    params.require(:story).permit(:title,:story)
  end
end
