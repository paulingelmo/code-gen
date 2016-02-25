class UrlsController < ApplicationController
  before_action :set_url, only: [:link, :destroy]
  before_action :set_url_short, only: [:link_short]
  # before_action :create_url_short, only: [:new]

  def index
    @urls = Url.all
  end

  def new
    @url_short = [*('a'..'z'),*('0'..'9')].sample(5).join
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to urls_path
    end
  end

  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to urls_path }
    end
  end

  def link
    redirect_to @url.url_long
  end

  def link_short
    redirect_to @url.url_long
  end

  private

  def set_url
    @url = Url.find(params[:id])
  end

  def set_url_short
    @url = Url.find_by(url_short: params[:url_short])
  end

  # def create_url_short
  #   @url_short = [*('a'..'z'),*('0'..'9')].sample(5).join
  # end

  def url_params
    params.require(:url).permit(:url_long, :url_short)
  end

end
