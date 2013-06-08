class ViewController < ApplicationController
  layout false
  # GET /ext4
  def ext4
    respond_to do |format|
      format.html # ext4.html.erb
    end
  end
end