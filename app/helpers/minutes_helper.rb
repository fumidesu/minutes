module MinutesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_minutes_path
    elsif action_name == 'edit'
      minute_path
    end
  end
end
