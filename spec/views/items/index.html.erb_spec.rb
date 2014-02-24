require 'spec_helper'

describe "items/index" do
  before(:each) do
    assign(:items, [
      stub_model(Item,
        :title => "Title",
        :desc => "MyText",
        :price => 1.5,
        :condition => "Condition",
        :user => nil
      ),
      stub_model(Item,
        :title => "Title",
        :desc => "MyText",
        :price => 1.5,
        :condition => "Condition",
        :user => nil
      )
    ])
  end

  it "renders a list of items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Condition".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
