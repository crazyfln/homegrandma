class MessagesController < ApplicationController
  # POST - property_messages_path(:property_id)
  #
  def create
    @message = property.messages.new message_params
    if @message.save
      NotificationMailer.view_contact_reply(@message.id).deliver
      flash[:success] = 'Thank you for contacting us'
      redirect_to property_path(property)
    else
      property
      @staffs        = User.limit(10)
      flash[:error]   = @message.errors.full_messages
      render "/properties/show"
    end
  end


  private

    # prepare selected property
    def property
      @property ||= Property.find params[:property_id]
    end


    # filter message params
    def message_params
      params.require(:message).permit(:name, :email, :estimated_date, :body, :claim_reward)
    end

end