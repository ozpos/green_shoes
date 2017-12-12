require_relative './widjets/spin_button'

Shoes.app width: 360, height: 200, title: 'a-append.rb' do
  # flow do
  @s1 = stack margin: 5 do
    border yellow, strokewidth: 4, curve: 10
    caption 'Parent'
    button "one"
    #spin_button val: 111, max: 114, min: 110
  end
  @s2 = flow margin: 5 do
    border red, strokewidth: 4, curve: 10
    caption 'Parent'
    button "one"
    #spin_button val: 111, max: 114, min: 110
  end
  button "Add from stack" do
    @s1.append do
      button "new"
      button "new"
      spin_button val: 111, max: 114, min: 110
    end
  end
  flow do
    button "Add from flow" do
      @s2.append do
        spin_button val: 111, max: 114, min: 110
        spin_button val: 111, max: 114, min: 110
        spin_button val: 111, max: 114, min: 110
        spin_button val: 111, max: 114, min: 110
        spin_button val: 111, max: 114, min: 110
      end
    end

  end
end