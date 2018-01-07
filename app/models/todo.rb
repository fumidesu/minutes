class Todo < ActiveRecord::Base

  belongs_to :user
  def self.reminder_mail
    @todos = Todo.all
    @todos.each do |todo|
      difference = todo.duedate - Date.today
      if todo.status != "closed"
        if difference <= 2
          NoticeMailer.sendmail_todo_reminder(todo).deliver
        end
      end
    end
  end
end
