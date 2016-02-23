class UrlsController < ApplicationController
  before_action :set_url, only: [:link, :destroy]

  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.url_short ||= [*('a'..'z'),*('0'..'9')].sample(5).join
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
  end

  private

  def set_url
    @url = Url.find(params[:id])
  end

  def url_params
    params.require(:url).permit(:url_long)
  end

end
