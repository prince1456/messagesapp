module ApplicationHelper

  def time_ago time
    "#{time_ago_in_words(time)} ago"
  end
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
   @devise_mapping ||= Devise.mappings[:user]
  end  
end
