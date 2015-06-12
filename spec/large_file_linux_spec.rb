require 'spec_helper'

describe LargeFileLinux do
  let(:path) { create_large_file }

  after do
    @lf.close if @lf
  end

  it 'has a version number' do
    expect(LargeFileLinux::VERSION).not_to be nil
  end

  it '#size' do
    @lf = LargeFileLinux.new(path, "r")
    expect(@lf.size).to eq(TOTAL_SIZE)
  end

  it '#close' do
    lf = LargeFileLinux.new(path, "r")
    expect { lf.close }.to_not raise_error
  end

  it '#read / #seek' do
    @lf = LargeFileLinux.new(path, "r")
    expect(@lf.read(5)).to eq("\0\0\0\0\0")

    seek_to_extra_data(@lf)
    expect(@lf.read(EXTRA_DATA.length)).to eq(EXTRA_DATA)
  end

  it '#write / #seek' do
    @lf = LargeFileLinux.new(path, "r+")

    seek_to_extra_data(@lf)
    @lf.write(EXTRA_DATA.reverse, EXTRA_DATA.length)

    seek_to_extra_data(@lf)
    expect(@lf.read(EXTRA_DATA.length)).to eq(EXTRA_DATA.reverse)
  end
end
