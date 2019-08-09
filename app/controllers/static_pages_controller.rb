class StaticPagesController < ApplicationController
  def home
  	@q = Company.ransack(params[:q])
  	binding.pry
  	@companies = @q.result.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
  end
end
