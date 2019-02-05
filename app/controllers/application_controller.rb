class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_usuario!

  rescue_from Pundit::NotAuthorizedError, with: :usuario_nao_autorizado

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

    def usuario_nao_autorizado
      flash[:alert] = "Você não está autorizado(a) a executar essa ação."
      redirect_to(request.referrer || root_path)
    end
end
