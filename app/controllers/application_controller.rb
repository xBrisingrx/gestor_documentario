class ApplicationController < ActionController::Base\
	
	def verify_d_type
      if ( !params[:d_type].nil?  ) 
        if params[:d_type].to_i == 1
          # personas
          @type = params[:d_type].to_i
        elsif params[:d_type].to_i == 2
          # vehiculos
          @type = params[:d_type].to_i
        else 
          # valor no aceptado, tengo que redireccionar a 404
          @type = 1
        end
        else
          # No esta definido, tengo que redireccionar a 404
          puts 'Valor no definido'
      end
    end
end
