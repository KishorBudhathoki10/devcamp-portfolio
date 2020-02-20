module ApplicationHelper
  def login_helper(style)
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, method: :get, class: style) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, method: :get, class: style;)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def sample_helper
    content_tag(:div, "My content", class: "my-class")
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout."
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    KishorsViewTool::Renderer.copyright('Kishor Budhathoki', 'All rights reserved')
  end
end
