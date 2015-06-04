class SquashesController < ApplicationController
  def create
    @notice = Notice.find(params[:notice_id])
    selector = {}
    if(params[:selector] == "class")
      selector = { exception_class: @notice.error_class }
    elsif params[:selector] == "messages"
      selector = { exception_class: @notice.error_class, exception_message: @notice.message }
    elsif params[:selector] == "backtrace"
      selector = { exception_class: @notice.error_class, exception_message: @notice.message, backtrace_fingerprint: @notice.backtrace.fingerprint }
    else
      raise "bad selector"
    end

    if params[:do] == "undelete"
      Squash.where(selector).first.destroy
    else
      Squash.create!(selector)
    end
  end
end
