class CompaniesController < ApplicationController
	def index
		@q = Company.ransack(params[:q])
		@companies = @q.result.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
		@user = current_user
	end

	def new
		@company_form = CompanyForm.new
    @q = Company.ransack(params[:q])
    @companies = @q.result.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
	end

	def create
    @company_form = CompanyForm.new company_form_params
    @q = Company.ransack(params[:q])
    @companies = @q.result.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
    @user = current_user
		if @company_form.save
      @companies = Company.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
  		respond_to do |format|
        format.js
      end
  	else
  		render :new
		end
	end

	def destroy
    @company.destroy
    redirect_to root_url
	end

  def show
    @company = Company.find(params[:id])
  end

  def update
  	@company = Company.find(params[:id])
  end
	private

  # Using strong parameters
  def company_form_params
    params.require(:company_form).permit!
  end

end
