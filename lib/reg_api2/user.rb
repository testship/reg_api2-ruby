# -*- encoding : utf-8 -*-

require 'reg_api2/entity/user'

module RegApi2
  # REG.API user category
  module User

    include RegApi2::Builder

    category :user

    # @!method nop
    # @param None
    # Accessibility testing.
    # @return [NilClass] nil
    define :nop

    # @!method create(opts = {})
    # @param opts Opts or {RegApi2::Entity::User}
    # @option opts [String] :user_login Login of the new user in the REG.API system. Allowed symbols: Latin lower-case letters (a-z), digits (0 -9) and the symbols "-" and "_".
    # @option opts [String] :user_password Password of the new user.
    # @option opts [String] :user_email E-mail of the new user.
    # @option opts [String] :user_country_code Two-letter ISO code of the country of residence of the new user, for example, 'RU'.
    # @return [String] user_id of new user.
    # @note Accessability: partners
    # New user registration.
    define :create, required: %w[ user_login user_password user_email user_country_code ], field: 'user_id', result: :single_field

    # @!method get_statistics(opts = {})
    # @param opts Opts
    # @option opts [String] :date_from This field sets the statistics start date (optional).
    # @option opts [String] :date_till This field sets the statistics end date (optional).
    # @note Accessability: clients
    # @note Support of service lists: no
    # Get user statistics.
    # @return [Hash(costs_for_period, active_domains_cnt, active_domains_get_ctrl_cnt, renew_domains_cnt, ...)] User statistics
    define :get_statistics, optional: %w[ date_till date_from ]

    # @!method get_balance(opts = {})
    # @param opts Opts
    # @option opts [String] :currency Define the currency in which the balance is presented. Conversion is performed automatically in accordance with the current exchange rates. Available options: RUR (default), USD, EUR, UAH.
    # @note Accessability: clients
    # @note Support of service lists: no
    # View current balance.
    # @return [Hash(currency, prepay, blocked, credit)] User balance
    define :get_balance, required: %w[ currency ]

    extend self
  end
end
