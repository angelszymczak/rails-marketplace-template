# frozen_string_literal: true

module Atoms
  module ServiceType
    class RadioInputComponent < ViewComponent::Base
      attr_reader :id, :value, :label_icon_url, :label_title, :input_icon_url, :description, :checked
      def initialize(
        id:,
        value:,
        label_icon_url:,
        label_title:,
        description:,
        checked: false
      )
        @id = id
        @value = value
        @label_icon_url = label_icon_url
        @label_title = label_title
        @input_icon_url = input_icon_url
        @description = description
        @checked = checked
      end

      private

      def input_name_key
        :service
      end
    end
  end
end
