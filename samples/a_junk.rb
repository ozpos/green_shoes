#class SampleStatus < Shoes::Widjet do
#  def initialize( name: "",desc: "", tested_ok: false )
#    status = Struct.new("Status",:name, :desc, :tested_ok)
#    status.new( :name, :desc, :tested_ok )
#  end
#end
Shoes.app title: "MAIN" do
  para self
  button "Spawn" do
    confirm "confirm"
   # ask "ask"
    Shoes.app title: "CHILD" do
      para self
    end
  end
end
