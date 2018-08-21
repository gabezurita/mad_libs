When /^I create a madlib with the text:$/ do |string|
  @madlib = MadLib.create(:text => string)
end

Then /^it should have the following fields:$/ do |table|
  table.hashes.each do |field|
    @madlib.has_field?(field[:label]).should be true
  end
end

When /^I assign the fields these values:$/ do |table|
  @solution = @madlib.solutions.create
  table.hashes.each do |field|
    @solution.fill_field(field[:label], :with => field[:value])
  end
end

Then /^the madlib should resolve to:$/ do |string|
  @solution.resolve.should == string
end

When /^I fill in the text:$/ do |string|
  fill_in("mad_lib_text", :with => string)
end

Then /^I should see the following fields:$/ do |table|
  table.hashes.each do |field|
    page.should have_content(field[:label])
  end
end

When /^I fill in the fields in this way:$/ do |table|
  table.hashes.each do |field|
    fill_in field[:label], :with => field[:value]
  end
end

Then /^I should see:$/ do |string|
  page.should have_content(string)
end

Then /^I should see the following uses:$/ do |table|
  table.hashes.each do |thing|
    page.should have_content(thing[:usage])
  end
end

Then /^I should see the following answers:$/ do |table|
  table.hashes.each do |answer|
    page.should have_content(answer[:answer])
  end
end

Given /^I input all these madlibs again$/ do
  visit path_to('the home page')
  fill_in("mad_lib_text", :with => "I {verb, past-tense} the {noun}. It was {adjective}.")
  click_button("Create")
  fill_in "Verb, past-tense (1):", :with => "walked"
  fill_in "Noun (1):", :with => "dog"
  fill_in "Adjective (1):", :with => "exciting"
  click_button("Fill In")
  visit path_to('the home page')
  fill_in("mad_lib_text", :with => "Programming is a craft. At its simplest, it comes down to getting a {noun} to do what you want it to do (or what your {noun} wants it to do). As a {job}, you are part listener, part advisor, part interpreter, and part {job}. You try to {verb} {adjective} requirements and find a way of expressing them so that a mere {noun} can do them justice. You try to {verb} your work so that others can {verb} it, and you try to engineer your {noun} so that others can {verb} on it. What's more, you try to do all this against the relentless {verb, ending in -ing} of the {noun}. You work {adjective} miracles every day.")
  click_button("Create")
  fill_in "Noun (1):", :with => "keyboard cat"
  fill_in "Noun (2):", :with => "dog"
  fill_in "Noun (3):", :with => "post-it"
  fill_in "Noun (4):", :with => "coke"
  fill_in "Noun (5):", :with => "cup"
  fill_in "Job (1):", :with => "airline pilot"
  fill_in "Job (2):", :with => "clown"
  fill_in "Verb (1):", :with => "sit"
  fill_in "Verb (2):", :with => "jump"
  fill_in "Verb (3):", :with => "sing"
  fill_in "Verb (4):", :with => "dance"
  fill_in "Adjective (1):", :with => "shiny"
  fill_in "Adjective (2):", :with => "bright"
  fill_in "Verb, ending in -ing (1):", :with => "dancing"
  click_button("Fill In")
end

