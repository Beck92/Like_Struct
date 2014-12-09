class Myst
  def initialize(name, *args)
    klass = Class.new do
      @@argumens = args
      attr_accessor *@@argumens
      def initialize (*args)
         @@argumens.zip(args) do |attr, val|
           send "#{attr}=", val
         end
        
      end
    end
    Object.const_set name, klass
  end
end

Myst.new("Hobbit", :name, :age)
hobbit = Hobbit.new("Frodo", 24)
puts hobbit.name
puts hobbit.age