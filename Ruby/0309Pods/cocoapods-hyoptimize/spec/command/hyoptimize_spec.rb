require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Hyoptimize do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ hyoptimize }).should.be.instance_of Command::Hyoptimize
      end
    end
  end
end

