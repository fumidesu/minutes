class MinutesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_minute, only: [:edit, :update, :destroy]

  def index
    @minutes = Minute.all
  end

def pdf
  @minute = Minute.find(params[:minutes])
  respond_to do |format|
    format.pdf do
      render pdf:  "title-#{Time.now.to_date.to_s}", template: 'minutes/show.html.erb'
# render pdf: "title-#{Time.now.to_date.to_s}",
#        encording: 'UTF-8',
#        template: 'pdf/pdf.html.erb',
#        layout: 'pdf.html',
#        orientation: 'Landscape',
#        page_size:   'A4',
#        show_as_html: params[:debug].present?
    end
  end
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
      if params[:minute][:mail]
         NoticeMailer.sendmail_minute(@minute).deliver
        respond_to do |format|
          format.pdf do
            render pdf:  "title-#{Time.now.to_date.to_s}", template: 'minutes/store.pdf.erb'
      # render pdf: "title-#{Time.now.to_date.to_s}",
      #        encording: 'UTF-8',
      #        template: 'pdf/pdf.html.erb',
      #        layout: 'pdf.html',
      #        orientation: 'Landscape',
      #        page_size:   'A4',
      #        show_as_html: params[:debug].present?
          end
        end
        #  format.html { redirect_to :action => 'index', :format => 'pdf', debug: 1 }
        #  format.pdf do
        #    render pdf:          "pdffile",                        # ".pdf"拡張子は不要
        #          footer:       {   html: {   template: 'minutes/footer.html.erb' } }, # footer用のテンプレートファイル指定
        #          store_as_html: params[:debug].present?  # debugを有効にする
        #  end
        #end
        redirect_to minutes_path, notice: "The minutes were submitted！"
        #redirect_to "pdf", minutes_path, notice: "The minutes were submitted!"
        else
        redirect_to store_minutes_path, notice: "The minutes were saved！"
        end
    else
      render 'new'
    end
  end

  def store
    @minutes = Minute.all
  end


    #@minute = Minute.create(minutes_params)
    #@minute.published = false
    #@minute.save

  def edit
  end

  def update
    if @minute.update(minutes_params)
      redirect_to store_minutes_path, notice: "The minutes were updated!"


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
