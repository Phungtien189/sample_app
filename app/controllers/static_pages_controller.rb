class StaticPagesController < ApplicationController
  def home
  	@q = Company.ransack(params[:q])
  	@companies = @q.result.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
  	@user = current_user
  end
end
