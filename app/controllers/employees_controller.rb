class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.paginate(page: params[:page], per_page: 10)
    @page_no = params[:page] || 1

  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @manager = Employee.find(params[:id])
    @subor = Employee.where(:manager_id => @manager.id)

    @employee_sub = Employee.pluck(:manager_id)
    @employee_sub_count = @employee_sub.group_by(&:itself).transform_values(&:count)
  end


  def relocation_requests
      @requested_employee = Employee.where(:willing => true)
      @total_requests = @requested_employee.count
  end


  def employee_city
    @city_employee = Employee.where(city_id:params[:city_id]).count
    respond_to do |format|
        format.js {render 'employees/employee_city'}
          #format.js { redirect_to @employee, notice: 'Employee was successfully created.' }
      end
  end

  def manager
    @employee = Employee.pluck(:manager_id)
    @manager = Employee.where(id: @employee).paginate(page: params[:page], per_page: 5)
    @page_no = params[:page] || 1
    @manager_sub_count = @employee.group_by(&:itself).transform_values(&:count)
  
    

  end


  # GET /employees/new
  def new
    @employee = Employee.new
    @allcity = City.all
  end

  # GET /employees/1/edit
  def edit
    @allcity = City.all
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
    @allcity = City.all
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:name, :city_id, :manager_id, :willing, :image, :image_cache)
    end
end
