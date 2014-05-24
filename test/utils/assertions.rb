module MiniTest::Assertions
  def assert_directory_exists(*args)
    dirname = args.compact.first
    assert Dir.exist?(dirname), "Expected '#{File.expand_path dirname}/' to exist but it does not"
  end
  
  def assert_file_exists(*args)
    filename = args.compact.first
    assert File.file?(filename), "Expected '#{File.expand_path filename}' to exist but it does not"
  end
end

String.infect_an_assertion   :assert_directory_exists, :must_be_a_directory
String.infect_an_assertion   :assert_file_exists, :must_be_a_file