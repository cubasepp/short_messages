Rails.application.routes.draw do
  resource :short_messages, only: [ :create ]
end
