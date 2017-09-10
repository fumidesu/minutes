class MinutesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_minute, only: [:edit, :update, :destroy]

  def index
    @minutes = Minute.all
  end

  def new
    if params[:back]
      @minute = Minute.new(minutes_params)
    else
    @minute = Minute.new
    end
  end

  def confirm
    @minute = Minute.new(minutes_params)
    render :new if @minute.invalid?
  end

  def create
    @minute = Minute.create(minutes_params)
    @minute.user_id = current_user.id
    if @minute.save
    redirect_to store_minutes_path, notice: "The minutes were saved！"
    else
      render 'new'
    end
  end

  def store
    @minutes = Minute.all
    #@minute = Minute.create(minutes_params)
    #@minute.published = false
    #@minute.save
  end

  def edit
  end

  def update
    if @minute.update(minutes_params)
      redirect_to minutes_path, notice: "The minutes were updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @minute.destroy
    redirect_to minutes_path, notice: "The minutes were deleted!"
  end


  private
      def minutes_params
        params.require(:minute).permit(:title, :date, :chairman, :department, :location, :participant, :absent, :cc, :agenda, :nummer, :subject, :action, :responsible, :duedate, :status)
      end

      def set_minute
           @minute = Minute.find(params[:id])
         end
end
