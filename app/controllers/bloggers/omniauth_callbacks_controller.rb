class Bloggers::OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def twitter
      @blogger = Blogger.find_for_twitter_oauth(request.remote_ip, request.env["omniauth.auth"], current_blogger)
      if @blogger
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
        sign_in_and_redirect @blogger, :event => :blogger
      else
        session["devise.twitter_data"] = request.env["omniauth.auth"]
        redirect_to new_blogger_registration_path
      end
    end

end
