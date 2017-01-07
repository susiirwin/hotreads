class LinksController < ApplicationController

  def create
    @link = Link.find_or_create_by(link_params)
    # increase count by 1 upon save
    @link.submission_count += 1
    if @link.save
      render json: @link, status: 201
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def index
    @links = Link.all
  end

  private
  def link_params
    params.permit(:url)
  end
end
