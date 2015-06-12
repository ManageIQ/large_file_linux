require 'spec_helper'

describe LargeFileLinux do
  it 'has a version number' do
    expect(LargeFileLinux::VERSION).not_to be nil
  end

  it '#read' do
    l = LargeFileLinux.new(__FILE__, "r")
    expect(l.read(21)).to eq("require 'spec_helper'")
  end
end
