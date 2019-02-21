class StaticPagesController < ApplicationController
  def help
  end

  def info
  end

  def send_help_mail
    logger.debug("Form params: #{params[:post]}")
    redirect_to help_path
  end

end
