class ApplicationController < ActionController::Base
    
    include Pagy::Backend
    I18n.default_locale = :es
    
end
