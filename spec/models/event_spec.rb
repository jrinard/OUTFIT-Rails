require 'rails_helper'

# unit testing spec

describe Event do
  it { should validate_presence_of :name }
  it { should belong_to :picture }
end
