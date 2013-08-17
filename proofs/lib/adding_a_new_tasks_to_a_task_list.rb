require_relative '../proofs_init'

title 'Adding Tasks'


module TaskList
  class Tasks
    module Proof
      def includes_task?(task)
        @tasks.include?(task)
      end

      def task_count?(number)
        @tasks.count == number
      end
    end
  end
end

proof 'Adding a new task to a task list' do
  sut = TaskList::Tasks.new
  task = TaskList::Task.new

  sut.add(task)

  desc 'The task should be added to the list of tasks'
  sut.prove { includes_task?(task) }

  desc 'The task list should only have one item'
  sut.prove { task_count?(1) }
end

proof 'Adding an existing task to a task list' do
  sut = TaskList::Tasks.new
  task = TaskList::Task.new

  sut.add(task)
  sut.add(task)

  desc 'Should not add the task again to the list of things to complete'
  sut.prove { task_count?(1) }
end


title 'Fetch a list of people from the database'

class Person
  include Initializer

  initializer :name, :age, :birthdate
end

class DataStore
  def self.instance()
    return DataStore.new
  end
  
  def save(*args)
  end
  def get(*args)
    return QueryObject.new(*args)
  end
end

class QueryObject
  def initialize(*args)
  end
  def all
    return []
  end
end

proof 'Fetch a list of people' do
  ds = DataStore.instance()

  p1 = Person.new("Me", 25, "1999-01-01")
  p2 = Person.new("Other", 99, "1995-01-01")

  ds.save(p1,p2)

  people = ds.get(:person).all()

  desc "Should have two people"
  people.prove {count == 2}
  desc "Should have first person in list"
  people.prove {include?(p1)}
  desc "Should have second person in list"
  people.prove {include?(p2)}
end












