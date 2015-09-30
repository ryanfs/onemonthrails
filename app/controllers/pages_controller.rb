class PagesController < ApplicationController
def new
    @search = Search.new
end

def home
  @spreadsheets = Spreadsheet.all

  if params[:q].present?
    @jobs = IndeedAPI.search_jobs(q: params[:q])
    @results = @jobs.results
    #@description = @results.company
  else
    @jobs = []
    @results =[]
  end

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