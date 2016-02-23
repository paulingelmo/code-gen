class SiteController < ApplicationController
  def search

    @term = params[:term]
    return if @term.nil?
    
    @results = [Artist, Label, Album].map do |model|
      model.search(@term)
    end.flatten

    # artists = Artist.where("name like ?", "%#{@term}%")
    # labels = Label.where("name like ?", "%#{@term}%")
    # albums = Album.where("name like ?", "%#{@term}%")
    # @results = artists + labels + albums
  end
end
