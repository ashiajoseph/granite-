# frozen_string_literal: true

module Authorizable
  extend ActiveSupport::Concern

  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :handle_authorization_error
  end

  def handle_authorization_error
    render status: :forbidden, json: { error: t("authorization.denied") }
  end
end
