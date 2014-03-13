class ContactController < ApplicationController

  def index
    render layout: 'public'
  end

  def show
    @contact_us = ContactUs.new
  end

  def create
    @contact_us = ContactUs.new contact_us_params
    if @contact_us.save
      NotificationMailer.new_contact_reply(@contact_us.id).deliver
      flash[:success] = 'Thank you for contacting us'
      redirect_to root_path
    else
      flash[:error] = @contact_us.errors.full_messages
      render action: 'show'
    end
  end


  private 

    def contact_us_params
      params.require(:contact_us).permit(:name, :email, :message, :phone)
    end

end
