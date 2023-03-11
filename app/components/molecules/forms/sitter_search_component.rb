# frozen_string_literal: true

module Molecules
  module Forms
    class SitterSearchComponent < ViewComponent::Base
      attr_reader :title, :service_type

      def initialize(
        title: nil,
        service_icon: nil,
        service_type: nil,
        service_title: nil,
        service_description: nil,
        address_placeholder: nil,
        submit_text: nil
      )
        @title               = title
        @service_type        = service_type
        @service_icon        = service_icon
        @service_title       = service_title
        @service_description = service_description
        @address_placeholder = address_placeholder
        @submit_text         = submit_text
      end
    end
  end
end
