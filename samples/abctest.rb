Shoes.app margin: 5, width: 100, height: 200 do
  border black, strokewidth: 5, curve: 20
  button "app flow 1"
  button "app flow 22"
  button "app flow 333"
  button "app flow 4444"
  button "app flow 55555"
  button "app flow 666666"
  stack margin: 10 do
    border yellow, strokewidth: 5, curve: 20
    button "stack 1"
    button "stack 2"
    button "stack 3"
    flow margin: 20 do
      border red, strokewidth: 5, curve: 20
      button "flow 1"
      button "flow 2"
      button "flow 3"
    end
    flow margin: 20 do
      border green, strokewidth: 5, curve: 20
      button "flow 1"
      button "flow 2"
      button "flow 3"
    end
  end
end