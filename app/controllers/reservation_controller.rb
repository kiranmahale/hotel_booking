class ReservationController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]

  # GET /users
  # GET /users.json
  # GET /users/new
  def new
    @reserve = Reservation.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
  	reserve_params = params[:reservation]
    @reserve = current_user.reservations.new(:category_id => reserve_params[:category_id], :date_in => reserve_params[:date_in], :date_out => reserve_params[:date_out], :room_id => reserve_params[:room_id])
    reserved = Reservation.is_reserved(reserve_params[:room_id],reserve_params[:date_in],reserve_params[:date_out])
    unless reserved
      respond_to do |format|
        if @reserve.save
          format.html { redirect_to myrooms_path, notice: 'Room has been booked' }
          format.json { render :show, status: :created, location: @reserve }
        else
          format.html { render :new }
          format.json { render json: @reserve.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to myrooms_path, notice: 'The Room is already Booked' }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @reserve.update(reserve_params)
        format.html { redirect_to myrooms_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @reserve.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @reserve.destroy
    respond_to do |format|
      format.html { redirect_to myroms_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:room_ids[], :category_id, :date_in, :date_out)
    end

end
