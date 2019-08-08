class CompaniesController < ApplicationController
	def index
		@companies = Company.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
	end

	def show
	end

end
