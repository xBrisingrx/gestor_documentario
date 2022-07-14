class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update]
  before_action :verify_d_type, only: [:index, :new, :edit]

  def index
    @companies = Company.where( active: true, d_type: @type )
  end

  def new
    @company = Company.new
  end

  def edit; end

  def create
    @company = Company.new( company_params )
    if @company.save
      render json: { msg: 'Empresa creada', status: 'success' }, status: :created
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  def update
    if @company.update(company_params)
        render json: { msg: "Empresa #{@company.name} a sido actualizada", status: 'success' }, status: :ok
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  def disable
    @company = Company.find(params[:company][:id])
    if @company.update(active: false)
      render json: { status: 'success', msg: "La empresa #{@company.name} fue eliminada" }, status: :ok
    else
      render json: { status: 'error', msg: 'Ocurrio un error al realizar la operación' }, status: :unprocessable_entity
    end

    rescue => e
      @response = e.message.split(':')
      render json: { @response[0] => @response[1] }, status: 402
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :description, :d_type, :active)
    end
end
