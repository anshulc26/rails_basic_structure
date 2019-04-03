class ApplicationController < ActionController::Base

  protected

  def authenticate_guide
    unless current_user.has_role? :guide
      flash[:notice] = t('errors.not_authorized')
      redirect_to root_path
    end
  end
end
