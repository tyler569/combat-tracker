class Combat < ApplicationRecord
  belongs_to :user

  has_many :characters

  def not_acted
    characters.filter { |c| !c.acted }
  end

  def initiative
    if characters.empty?
      return 0
    end

    if not_acted.empty?
      new_round
    end

    not_acted
      .map { |c| c.initiative }
      .max
  end

  def new_round
    characters.each do |c|
      c.acted = false
      c.save
    end

    self.round += 1
    save
  end

  def next_to_act
    not_acted.filter { |c| c.initiative == initiative }
  end

  def act(source, target, attack_type, value)
  end

  def players
    characters.map { |c| c.user }.uniq
  end

  def to_json
    {
      name: name,
      players: players,
      initiative: initiative,
      characters: characters,
    }
  end
end
