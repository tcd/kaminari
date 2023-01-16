# frozen_string_literal: true

module Kaminari
  # Configures global settings for Kaminari
  #
  # @example
  #   Kaminari.configure do |config|
  #     config.default_per_page = 10
  #   end
  class << self

    # @yieldparam [Kaminari::Config] config
    # @return [void]
    def configure
      yield config
    end

    # @return [Kaminari::Config]
    def config
      @_config ||= Config.new
    end
  end

  class Config
    # @return [Integer]
    attr_accessor :default_per_page
    # @return [Integer]
    attr_accessor :max_per_page
    # @return [Integer]
    attr_accessor :window
    # @return [Integer]
    attr_accessor :outer_window
    # @return [Integer]
    attr_accessor :left
    # @return [Integer]
    attr_accessor :right
    # @return [Symbol]
    attr_accessor :page_method_name
    # @return [Integer]
    attr_accessor :max_pages
    # @return [Boolean]
    attr_accessor :params_on_first_page

    # @return [Symbol]
    attr_writer :param_name

    def initialize
      @default_per_page = 25
      @max_per_page = nil
      @window = 4
      @outer_window = 0
      @left = 0
      @right = 0
      @page_method_name = :page
      @param_name = :page
      @max_pages = nil
      @params_on_first_page = false
    end

    # If param_name was given as a callable object, call it when returning
    def param_name
      @param_name.respond_to?(:call) ? @param_name.call : @param_name
    end
  end
end
