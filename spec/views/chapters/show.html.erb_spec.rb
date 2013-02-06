require 'spec_helper'

describe "chapters/show" do
  before(:each) do
    @chapter = assign(:chapter, stub_model(Chapter,
      :title => "Title",
      :order_by => 1,
      :body => "MyText",
      :experience_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
  end
end
