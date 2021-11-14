module ApplicationHelper
  def active_navigation?(path)
    current_path = request.fullpath

    current_path.include?(path) || current_path == '/'
  end
end
