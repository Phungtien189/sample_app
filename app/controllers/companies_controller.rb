class CompaniesController < ApplicationController
	def index
		@companies = Company.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
	end

	def show
	end

	def new
		@company_form = CompanyForm.new
	end

	def create
        @company_form = CompanyForm.new(company_form_params)
		if @company_form.save
      		redirect_to root_url, notice: "Created Company"
      	else
      		render :new
    	end
	end

	private

  # Using strong parameters
  def company_form_params
    params.require(:company_form).permit!
  end

end
