class LinksController < ApplicationController
  def create
    @link = Link.new(link_params)
    if @link.save
      render json: @link, status: 201
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def index

  end

  private
  def link_params
    params.permit(:url)
  end
end
