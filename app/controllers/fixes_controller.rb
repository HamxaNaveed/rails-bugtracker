class FixesController < ApplicationController
  before_action :set_fix, only: %i[ show edit update destroy assign complete]
  before_action :get_project

  # GET /fixes or /fixes.json
  def index
    @fixes = @project.fixes
  end

  # GET /fixes/1 or /fixes/1.json
  def show
  end

  # GET /fixes/new
  def new
    @fix = @project.fixes.build
    authorize @fix
  end

  # GET /fixes/1/edit
  def edit
  end

  # POST /fixes or /fixes.json
  def create
    @fix = @project.fixes.build(fix_params)

    respond_to do |format|
      if @fix.save
        format.html { redirect_to project_fixes_path(@project,@fix), notice: "Fix was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def assign
    respond_to do |format|
      if @fix.update(assign_to_id: current_user.id)
        format.json { render json: @fix.assign_to.email.to_json}    
        format.html { redirect_to  project_fixes_path(@project), notice: "Fix is assigned" }
      else
        format.json { render json: @fix.errors }
      end
    end
    authorize @fix
  end

  def complete
    respond_to do |format|
      if @fix.update(complete: true)
        format.json { render json: @fix.assign_to.email.to_json}    
        format.html { redirect_to  project_fixes_path(@project), notice: "Fix is completed" }
      else
        format.json { render json: @fix.errors }
      end
    end
    authorize @fix
  end

  # PATCH/PUT /fixes/1 or /fixes/1.json
  def update
    respond_to do |format|
      if @fix.update(fix_params)
        format.html { redirect_to  project_fix_path(@project), notice: "Fix was successfully updated." }
        format.json { render :show, status: :ok, location: @fix }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fixes/1 or /fixes/1.json
  def destroy
    @fix.destroy

    respond_to do |format|
      format.html { redirect_to project_fixes_path(@project), notice: "Fix was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def get_project
    @project = Project.find(params[:project_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_fix
      @project = Project.find(params[:project_id])
      @fix = @project.fixes.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fix_params
      params.require(:fix).permit(:name, :description, :project_id, :image)
    end
end
