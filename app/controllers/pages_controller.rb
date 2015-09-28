class PagesController < ApplicationController
def new
    @search = Search.new
end

def home
  @spreadsheets = Spreadsheet.all
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

def search
  @spreadsheet = Spreadsheet.create(description:'test')
  redirect_to '/spreadsheets/'+@spreadsheet.id.to_s
end


end