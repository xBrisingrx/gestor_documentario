class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update ]
  before_action :set_companies, only: %i[ new edit create update ]

  def index
    @people = Person.where(active: true)
  end

  def show
  end

  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.save
        format.json { render json: {url: people_path}, status: :created }
        format.html { redirect_to people_path, notice: "Se registro una nueva persona." }
      else
        format.json { render json: @person.errors, status: :unprocessable_entity }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.json { render json: {url: people_path}, status: :ok }
        format.html { rredirect_to people_path, notice: "Datos actualizados." }
      else
        format.json { render json: @person.errors, status: :unprocessable_entity }
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    def set_companies
      @companies = Company.where( active: true, d_type: 1 )
    end

    def person_params
      params.require(:person).permit(:company_id, :legajo, :name, :last_name, :dni, :cuil, :dni_has_expiration, 
                                      :expiration_date_dni, :birth_date, :nationality, :direction, :phone, :start_activity, 
                                      :pdf_dni, :pdf_cuil, :pdf_start_activity, :active)
    end
end
