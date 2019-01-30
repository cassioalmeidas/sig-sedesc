class ApplicationController < ActionController::Base
  before_action :authenticate_usuario!

  layout :layout_by_resource

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end

  private 
    def layout_by_resource
      devise_controller? ? 'devise' : 'application'
    end
end
