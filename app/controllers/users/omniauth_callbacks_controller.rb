class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user, :event => :authentication, email: request.env["omniauth.auth"].info.email
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url, email: session["devise.google_data"].info.email
      end
  end
  alias_method :facebook, :google_oauth2

  def venmo
    session["devise.venmo"] = request.env["omniauth.auth"]
    data = {access_token: session["devise.venmo"].credentials.token,
              email: "khoitran_2014@depauw.edu",
              note: "testing",
              amount: "0.10",
              dataType: 'jsonp'
    }
    url = "https://api.venmo.com/v1/payments"
    #https://sandbox-api.venmo.com/v1/payments
    res = Net::HTTP.post_form(URI.parse(url), data)
    session["response"] = JSON.parse(res.body)
    redirect_to pay_path
    #render :json => res.body
  end
end
