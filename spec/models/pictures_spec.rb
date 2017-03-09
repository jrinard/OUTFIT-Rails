require 'rails_helper'

# unit testing spec

describe Picture do
  it { should validate_presence_of :title }
end
