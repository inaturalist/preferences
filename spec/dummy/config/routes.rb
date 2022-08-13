Rails.application.routes.draw do
  mount Preferences::Engine => "/preference"
end
