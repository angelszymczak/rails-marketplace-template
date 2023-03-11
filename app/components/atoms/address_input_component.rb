# frozen_string_literal: true

module Atoms
  class AddressInputComponent < ViewComponent::Base
    attr_reader :size, :label, :label_icon_url, :placeholder

    SIZES = %i[sm lg]
    def initialize(size:, label:, label_icon_url:, placeholder:)
      raise ArgumentError, "Size must be :sm or :lg" unless SIZES.include?(size)

      @size = size
      @label = label
      @label_icon_url = label_icon_url
      @placeholder = placeholder
    end

    def size_variant
      "--#{size}"
    end
  end
end
