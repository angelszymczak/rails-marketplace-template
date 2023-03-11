# frozen_string_literal: true

module Atoms
  module Buttons
    class SubmitComponent < ViewComponent::Base
      attr_reader :size, :text

      SIZES = %i[sm lg]
      def initialize(size:, text:)
        raise unless SIZES.include?(size)

        @size = size
        @text = text
      end

      def size_variant
        "--#{@size}"
      end
    end
  end
end
