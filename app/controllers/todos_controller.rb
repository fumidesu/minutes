class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only: [:edit, :update, :destroy]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.create(todos_params)
    @todo.user_id = current_user.id
    if @todo.save
    redirect_to todos_path, notice: "A new action is required！"
    NoticeMailer.sendmail_todo(@todo).deliver
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @todo.update(todos_params)
      redirect_to todos_path, notice: "The status was updated！"
      if @todo.status == "closed"
        NoticeMailer.sendmail_todo_update(@todo).deliver
      end
    else
      render 'edit'
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path, notice: "The action was eliminated！"
  end

  private
      def todos_params
        params.require(:todo).permit(:date, :action, :responsible, :duedate, :status)
      end

      def set_todo
           @todo = Todo.find(params[:id])
      end

end
