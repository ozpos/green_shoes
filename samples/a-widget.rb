#class SpinButton < Shoes::Widget
#  def initialize(text, value=128)
#    val = value
#    button "+" do
#      val=val+1 if val < 255
#      @para.replace val
#    end
#    @para = para val
#    button "-" do
#      val=val-1 if val > 1
#      @para.replace val
#    end
#  end
#end
#require 'green_shoes'
require_relative './widjets/spin_button'

Shoes.app width: 360, height: 200 do
  stack do
    caption "Stack"
    spin_button val: 123456, max: 888888
    button 'b2'
    spin_button val: 21, max: 13
  end
  flow do
    caption "Flow"
    spin_button val: 253, max: 10
    spin_button val: -10, max: 888888
    button 'b1'
    spin_button val: 253, max: 12
    spin_button val: 7, max: 13
  end
end