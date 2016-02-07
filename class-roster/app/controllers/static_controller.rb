class StaticController < ApplicationController

  def hello
    @year = Time.now.year
  end

end
