class ScootsController < ApplicationController
  before_action :set_scoot, only: [:show, :edit, :update, :destroy]

  # GET /scoots
  # GET /scoots.json
  def index
    @scoots = Scoot.show_leaves(current_user)
  end

  # GET /scoots/1
  # GET /scoots/1.json
  def show
  end

  # GET /scoots/new
  def new
    @scoot = Scoot.new
  end

  # GET /scoots/1/edit
  def edit
  end

  # POST /scoots
  # POST /scoots.json
  def create
    @scoot = Scoot.new(scoot_params)
    
    respond_to do |format|
      if @scoot.save
        format.html { redirect_to root_url, notice: 'Scoot was successfully created.' }
        format.json { render :show, status: :created, location: @scoot }
      else
        format.html { render :new }
        format.json { render json: @scoot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scoots/1
  # PATCH/PUT /scoots/1.json
  def update
    if params[:commit] == 'Accept'
      params[:scoot][:state] = 'accepted'
    else
      params[:scoot][:state] = 'rejected'
    end
    respond_to do |format|
      if @scoot.update(scoot_params)
        format.html { redirect_to root_url, notice: 'Scoot was successfully updated.' }
        format.json { render :show, status: :ok, location: @scoot }
      else
        format.html { render :edit }
        format.json { render json: @scoot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scoots/1
  # DELETE /scoots/1.json
  def destroy
    @scoot.destroy
    respond_to do |format|
      format.html { redirect_to scoots_url, notice: 'Scoot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accepted
    @scoots = Scoot.accepted_leaves
  end

  def rejected
    @scoots = Scoot.rejected_leaves
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scoot
      @scoot = Scoot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scoot_params
      params.require(:scoot).permit(:subject, :body, :leave_from, :leave_to, :state, :reason, :user_id)
    end
end
