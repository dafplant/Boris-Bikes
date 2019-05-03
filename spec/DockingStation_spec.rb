require './lib/DockingStation'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}

  describe '#release_bike' do
    it "releases working bikes" do
      # bike = subject.release_bike
      # expect(bike.working?).to eq true
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error when there are no bikes' do
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end
  end

  it {is_expected.to respond_to(:dock).with(1).argument}

  #it {is_expected.to respond_to(:bikes)}

  describe '#dock' do
    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
  end
    it 'raises an error if there is more than 1 bike' do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new) }
      expect {subject.dock Bike.new}.to raise_error 'Docking station is full'
    end
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.dock(bike)).to eq(bike)
  end

  # it 'returns an error when there are no bikes' do
  #   docking_station = DockingStation.new
  #   expect {docking_station.release_bike}.to raise_error("There are no bikes")
  # end

end
