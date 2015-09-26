class PagesController < ApplicationController
def new
    @search = Search.new
end

def create
  @search = Search.new(params[:contact])
  @search.request = request
  if @search.deliver
  else
    flash.now[:error] = 'Something went wrong, please try your search again.'
    render :new
  end
end

  def about
  end

end