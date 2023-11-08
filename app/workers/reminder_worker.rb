class ReminderWorker
  include Sidekiq::Worker

  def perform
    todos = Todo.joins(:user).where("due_date < ?", Time.now + 1.hour ).all
    return if todos.size.zero?

    todos.each do |todo|
      # implement send email
      send_email(todo.user.email, 'sender@example.com', 'Reminder', "Your task has due on #{todo.due_date}")
    end
  end
end