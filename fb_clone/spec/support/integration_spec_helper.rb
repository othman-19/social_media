# frozen_string_literal: true

module IntegrationSpecHelper
  def login_with_oauth(service = :facebook)
    visit "/auth/#{service}"
  end
end
