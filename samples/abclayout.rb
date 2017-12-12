Shoes.app margin: 0, width: 500, resizable: true, title: "Layout Test" do
  stack do
    flow do
      @test_simple=radio :test_level;para "Simple"
      @test_all=radio :test_level ;para "All"
    end
  #flow margin_left:0 do
  #  stack width:1.0, align: "center" do
  #    flow width: 1.0 do
  #      border black
  #      background "#eeeeee"
  #      para "Outer Flow Width 0.95, margin: 10", align: "center"
  #    end
  #    flow width: 1.0 do
  #      border black
  #      background "#ffccdd"
  #      para "Inner left flow, width: 0.3333, margin: 5, align: 'left'", align: "center"
  #    end
  #    flow width: 1.0 do
  #      border black
  #      background "#ccddff"
  #      para "Inner center flow, width: 0.3333, margin: 5, align: 'center'", align: "center"
  #    end
  #    flow width: 1.0 do
  #      border black
  #      background "#ddffcc"
  #      para "Inner right flow, width: 0.3333, margin: 5, align: 'right'", align: "center"
  #    end
  #  end
  #end
  #flow margin: 10, width: 1.0, align:"left" do
  #  background "#eeeeee"
  #  flow margin:20, width: 0.3333, align: "left" do
  #    background "#ffccdd"
  #    border blue
  #    button "B1 f1", height:30, width:60, margin: 15
  #    button "B2 f1", height:30, width:70, margin: 15
  #    button "B3 f1", height:30, width:80, margin: 15
  #  end
  #  flow margin:20, width: 0.3333, align: "left" do
  #    background "#ccddff"
  #    border black
  #    button "B1 f2", height:30, width:60, margin: 15
  #    button "B2 f2", height:30, width:70, margin: 15
  #    button "B3 f2", height:30, width:80, margin: 15
  #  end
  #  flow margin:20, width: 0.3333, align: "left" do
  #    background "#ddffcc"
  #    border blue
  #    button "B1 f3", height:30, width:60, margin: 15
  #    button "B2 f3", height:30, width:70, margin: 15
  #    button "B3 f3", height:30, width:80, margin: 15
  #  end
  #end

  #flow margin: 10, width: 0.5, align:"left" do
  #  background "#eeeeee"
  #  flow margin:20, width: 0.3333, align: "left" do
  #    background "#ffccdd"
  #    border blue
  #    button "B1 f1", height:30, width:60, margin: 5
  #    button "B2 f1", height:30, width:70, margin: 5
  #    button "B3 f1", height:30, width:80, margin: 5
  #  end
  #  flow margin:20, width: 0.3333, align: "left" do
  #    background "#ccddff"
  #    border black
  #    button "B1 f2", height:30, width:60, margin: 5
  #    button "B2 f2", height:30, width:70, margin: 5
  #    button "B3 f2", height:30, width:80, margin: 5
  #  end
  #  flow margin:20, width: 0.3333, align: "left" do
  #    background "#ddffcc"
  #    border blue
  #    button "B1 f3", height:30, width:60, margin: 5
  #    button "B2 f3", height:30, width:70, margin: 5
  #    button "B3 f3", height:30, width:80, margin: 5
  #  end
  #end
  #flow margin: 10, width: 0.5, align:"right" do
  #  background "#eeeeee"
  #  flow margin:20, width: 0.3333, align: "left" do
  #    background "#ffccdd"
  #    border blue
  #    button "B1 f1", height:30, width:60, margin: 5
  #    button "B2 f1", height:30, width:70, margin: 5
  #    button "B3 f1", height:30, width:80, margin: 5
  #  end
  #  flow margin:20, width: 0.3333, align: "center" do
  #    background "#ccddff"
  #    border black
  #    button "B1 f2", height:30, width:60, margin: 5
  #    button "B2 f2", height:30, width:70, margin: 5
  #    button "B3 f2", height:30, width:80, margin: 5
  #  end
  #  flow margin:20, width: 0.3333, align: "right" do
  #    background "#ddffcc"
  #    border blue
  #    button "B1 f3", height:30, width:60, margin: 5
  #    button "B2 f3", height:30, width:70, margin: 5
  #    button "B3 f3", height:30, width:80, margin: 5
  #  end
  #end
  flow width:1.0 do
  f1 = flow margin: 10, align:"left" do
    background "#eeeeee"
    f1_1 = flow margin:10,align: "right",width:0.3 do
      background "#ffccdd"
      border blue
      button "B1 f1", height:30, width:60, margin: 5 do
        self.parent.style(align:"center")
      end
      button "B2 f1", height:30, width:70, margin: 5 do
        #self.parent.style(width:0.15)
       # window do

        root = root_app self.app
          para "Hello " + root.inspect.to_s
        #end
        #my_parent do
        #  flush
        #end
        prepend {para "Hello #{self.parent}"}
        #hide
      end
      b3 = button "B3 f1", height:30, width:80, margin: 5 do
        b3.parent.style(align:"right")
      end
    end
    flow margin:10, align: "center",width:0.3 do
      background "#ccddff"
      border black
      button "B1 f2", height:30, width:60, margin: 5
      button "B2 f2", height:30, width:70, margin: 5
      button "B3 f2", height:30, width:80, margin: 5
    end
    flow margin:10,  align: "right",width:0.3 do
      background "#ddffcc"
      border blue
      button "B1 f3", height:30, width:60, margin: 5
      button "B2 f3", height:30, width:70, margin: 5
      button "B3 f3", height:30, width:80, margin: 5
    end
  end
  end
#  flow margin: 10, width: 0.75, align:"right" do
#    stack align: "right" do
#      background "#ccddcc"
#      banner("Banner")
#      flow width: 0.75, align:"right" do
#        button "B1 s1", height:30, width:60, margin: 50
#        background "#e0e0e0"
#        flow margin:20, width: 0.3333, align: "left" do
#          background "#ffccdd"
#          border blue
#          button "B1 f1", height:30, width:60, margin: 5
#          button "B2 f1", height:30, width:70, margin: 5
#          button "B3 f1", height:30, width:80, margin: 5
#        end
#        edit_box "This is a parograph", align: "right"
#        flow margin:20, width: 0.3333, align: "center" do
#          background "#ccddff"
#          border black
#          button "B1 f2", height:30, width:60, margin: 5
#          button "B2 f2", height:30, width:70, margin: 5
#          button "B3 f2", height:30, width:80, margin: 5
#        end
#        flow margin:20, width: 0.3333, align: "right" do
#          background "#ddffcc"
#          border blue
#          button "B1 f3", height:30, width:60, margin: 5
#          button "B2 f3", height:30, width:70, margin: 5
#          button "B3 f3", height:30, width:80, margin: 5
#        end
#      end
#      flow width: 0.8 do
#        flow margin: 0, width: 0.6, align:"left" do
#          background "#eeeeee"
#          flow margin:10, width: 0.2, align: "left" do
#            background "#ffccdd"
#            border blue
#            button "B1 f1", height:30, width:60, margin: 5
#            button "B2 f1", height:30, width:70, margin: 5
#            button "B3 f1", height:30, width:80, margin: 5
#          end
#          flow margin:10, width: 0.2, align: "center" do
#            background "#ccddff"
#            border black
#            button "B1 f2", height:30, width:60, margin: 5
#            button "B2 f2", height:30, width:70, margin: 5
#            button "B3 f2", height:30, width:80, margin: 5
#          end
#          edit_line "Edit this line of text"
#          flow margin:10, width: 0.2, align: "right" do
#            background "#ddffcc"
#            border blue
#            button "B1 f3", height:30, width:60, margin: 5
#            button "B2 f3", height:30, width:70, margin: 5
#            button "B3 f3", height:30, width:80, margin: 5
#          end
#        end
#        flow margin: 0, width: 0.4, align:"right" do
#          background "#aaaaaa"
#          flow margin:10, width: 0.3333, align: "left" do
#            background "#ffccdd"
#            border blue
#            button "B1 f1", height:30, width:60, margin: 5
#            button "B2 f1", height:30, width:70, margin: 5
#            button "B3 f1", height:30, width:80, margin: 5
#          end
#          flow margin:10, width: 0.3333, align: "center" do
#            background "#ccddff"
#            border black
#            button "B1 f2", height:30, width:60, margin: 5
#            button "B2 f2", height:30, width:70, margin: 5
#            button "B3 f2", height:30, width:80, margin: 5
#          end
#          flow margin:10, width: 0.3333, align: "right" do
#            background "#ddffcc"
#            border blue
#            button "B1 f3", height:30, width:60, margin: 5
#            button "B2 f3", height:30, width:70, margin: 5
#            button "B3 f3", height:30, width:80, margin: 5
#          end
#        end
#      end
#    end
#  end
#end
#    end
  #stack margin:10 do
  #  background "#ffddaa"
  #  title "Title", align: "center"
  #end
#end
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
    end
end