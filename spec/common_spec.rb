class Ex
  extend ContractProgramming

  contract def meth(num)
    num.to_s
  end
end

describe 'common testing' do
  let(:ex){ Ex.new }

  context 'when check methods is not defined' do
    it 'do nothing' do
      expect(ex.meth 1).to eq '1'
    end
  end

  context 'when check methods is defined' do
    before :all do
      class Ex
        def pre_meth(num)
          check_it 'must be a num', Fixnum === num
        end

        def post_meth(result)
          check_it 'must be a string', String === result
        end
      end
    end
    it 'succesfully implemented method with valid params' do
      expect(ex.meth 1).to eq '1'
    end

    it 'raise error when arguments not conform to contract' do
      expect{ex.meth '1'}.to raise_error ArgumentError, 'must be a num'
    end

    it 'rails error when output not conform to contract' do
      class Ex
        def meth(num)
          num
        end
      end
      expect{ex.meth 1}.to raise_error ArgumentError, 'must be a string'
    end
  end
end
