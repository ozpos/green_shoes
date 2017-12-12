Shoes.app margin: 5, width: 100, height: 60 do
#  button "button 1", margin: 10
#  button "button 2", margin: 10
#  button "button 3", margin: 10
#  button "button 4", margin: 10
  background darkgray
  border black, strokewidth: 5, curve: 20
  button( "app flow 1", margin: 2) { ask "hello"}
  button "app flow 22", margin: 2
  button "app flow 333", margin: 2
  button "app flow 4444", margin: 2
  button "app flow 55555", margin: 2
  button "app flow 666666", margin: 2
  stack margin: 10 do
    border yellow, strokewidth: 5, curve: 20
    button "stack 1", margin: 2
    button "stack 2", margin: 2
    button "stack 3", margin: 2
    flow margin: 20 do
      border red, strokewidth: 5, curve: 20
      button "flow 1", margin: 2
      button "flow 2", margin: 2
      button "flow 3", margin: 2
    end
    flow margin: 20 do
      border green, strokewidth: 5, curve: 20
      button "flow 1", margin: 2
      button "flow 2", margin: 2
      button "flow 3", margin: 2
    end
  end
end