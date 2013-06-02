Shoes.app margin: 0, width: 240, resizable: true, title: "f0 600 x 200, f1m10, f2,f3,f4=33% b1-9mt10mb10" do
  #background "#ddffff"
  #stack margin:10 do
  #  background "#ffffcc"
  #  banner "Banner", align: "center"
  #end
  flow margin_left:10 do
    stack width:0.25 do
      para "Para 1"
      para "Para 2"
      para "Para 3"
      para "Para 4"
      para "Para 5"
    end
  end
  flow margin_right: 10, width: 0.75, align:"right" do
    background "#ffddcc"
    flow margin:5, width: 0.3333, align: "left" do
      background "#ffccdd"
      border blue
      button "B1 f1", margin: 2
      button "B2 f1", margin: 2
      button "B3 f1", margin: 2
    end
    flow margin:5, width: 0.3333, align: "center" do
      background "#ccddff"
      border black
      button "B1 f2", margin: 2
      button "B2 f2", margin: 2
      button "B3 f2", margin: 2
    end
    flow margin:5, width: 0.3333, align: "right" do
      background "#ffccdd"
      border blue
      button "B1 f3", margin: 2
      button "B2 f3", margin: 2
      button "B3 f3", margin: 2
    end
  end
  #stack margin:10 do
  #  background "#ffddaa"
  #  title "Title", align: "center"
  #end
end
#  end
#    flow margin: 10, align: "left" do
  #background "#eeff22"
 #   button "Banner", align: "left"
 # end
#  flow margin: 0, align: "left" do
#    background red
#  flow margin: 0, width: 0.333, align: "left" do
#       #background yellow
#    button "B1 f1", margin_top: 10, margin_bottom: 10
#    button "B2 f1", margin_top: 10, margin_bottom: 10
#    button "B3 f1", margin_top: 10, margin_bottom: 10
#  end
#  flow margin: 0, width: 0.333, align: "left" do
#    button "B1 f2", margin_top: 10, margin_bottom: 10
#    button "B2 f2", margin_top: 10, margin_bottom: 10
#    button "B3 f2", margin_top: 10, margin_bottom: 10
#  end
#  flow margin: 0, width: 0.333, align: "left" do
#    button "B1 f3", margin_top: 10, margin_bottom: 10
#    button "B2 f3", margin_top: 10, margin_bottom: 10
#    button "B3 f3", margin_top: 10, margin_bottom: 10
#  end
#  end
#end