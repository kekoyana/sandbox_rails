# frozen_string_literal: true

Rails.application.routes.draw do
  resource :homes, only: %w[show]
end
