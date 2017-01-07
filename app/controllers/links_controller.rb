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
    # limit @links to 10 total by ascending order of submission_count
    @links = Link.where(updated_at: (Time.now - 24.hours)..Time.now).order(submission_count: :desc).limit(10)

  end

  private
  def link_params
    params.permit(:url)
  end
end
