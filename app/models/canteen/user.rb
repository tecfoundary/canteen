module Canteen
  class User

    # Used to store the currently logged in user.
    cattr_accessor :current

    include Mongoid::Document
    include Mongoid::Timestamps
    
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    field :admin,              type: Boolean, default: false

    ## Database authenticatable
    field :email,              type: String, default: ""
    field :name,               type: String, default: ""
    field :encrypted_password, type: String, default: ""

    ## Recoverable
    field :reset_password_token,   type: String
    field :reset_password_sent_at, type: Time

    ## Rememberable
    field :remember_created_at, type: Time

    ## Trackable
    field :sign_in_count,      type: Integer, default: 0
    field :current_sign_in_at, type: Time
    field :last_sign_in_at,    type: Time
    field :current_sign_in_ip, type: String
    field :last_sign_in_ip,    type: String

    ## Confirmable
    # field :confirmation_token,   type: String
    # field :confirmed_at,         type: Time
    # field :confirmation_sent_at, type: Time
    # field :unconfirmed_email,    type: String # Only if using reconfirmable

    ## Lockable
    # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
    # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
    # field :locked_at,       type: Time

    def admin?
      self.admin
    end

    # FIXME: https://github.com/plataformatec/devise/issues/2949 - Remove below once fix has been shipped
    class << self
      def serialize_from_session(key,salt)
        logger.debug "KEY - #{key}"
        logger.debug "SALT - #{salt}"
        record = to_adapter.get(key[0]["$oid"])
        logger.debug "RECORD - #{record}"
        # logger.debug "RECORD AUTH SALT - #{record.authenticatable_salt}"
        record if record && record.authenticatable_salt == salt
      end
    end
  end
end