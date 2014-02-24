require 'spec_helper'

describe "items/show" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :title => "Title",
      :desc => "MyText",
      :price => 1.5,
      :condition => "Condition",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/1.5/)
    rendered.should match(/Condition/)
    rendered.should match(//)
  end
end
