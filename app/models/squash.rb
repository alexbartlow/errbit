require "recurse"

class Squash
  include Mongoid::Document
  include Mongoid::Timestamps

  field :backtrace_fingerprint
  field :exception_class
  field :exception_message
end
