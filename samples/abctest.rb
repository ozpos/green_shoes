Shoes.app margin: 0, align: "right", width: 600, height: 200, resizable: true, title: "f0 600 x 200, f1m10, f2,f3,f4=33% b1-9mt10mb10" do
  edit_box width:0.25
  para "Search", width: 0.25

  stack margin:10, align:"right" do
  #  button "Button"
  flow width: 0.25,align: "right" do
    para "Search"
    edit_line
  end
  #  list_box :items => ["Apples","Oranges","Pears"]
  para "Search"
  edit_line
    edit_box
  #  oval radius:20
  #  #Problems
  #@p = progress width: 300   # Cannot set width.
  #  #animate do |i|
  #  #  @p.fraction = (i % 100)/100.0
  #  #end
  title "Title"                    # Upsets flow resizing
  para "Choose a fruit:"           # Upsets flow resizing
  banner "Banner", align:"center"  # Upsets flow resizing
  flow margin: 0 do
  #border black
  background pink
  #button "Button"
  #button "Button"
  flow margin:0, width: 0.3333, align: "right" do
    border blue
    button "B1 f1", margin_top: 10, margin_bottom: 10
    button "B2 f1", margin_top: 10, margin_bottom: 10
    button "B3 f1", margin_top: 10, margin_bottom: 10
  end
  flow margin:0, width: 0.3333, align: "left" do
    border blue
    button "B1 f1", margin_top: 10, margin_bottom: 10
    button "B2 f1", margin_top: 10, margin_bottom: 10
    button "B3 f1", margin_top: 10, margin_bottom: 10
  end
  flow margin:0, width: 0.3333, align: "left" do
    border blue
    button "B1 f1", margin_top: 10, margin_bottom: 10
    button "B2 f1", margin_top: 10, margin_bottom: 10
    button "B3 f1", margin_top: 10, margin_bottom: 10
    edit_box
  end
  end
  end
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